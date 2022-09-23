import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:heic_to_jpg/heic_to_jpg.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:path/path.dart' as p;
import 'package:retrofitapi_flutter/constants/constants.dart';
import 'package:retrofitapi_flutter/remote/service/news_services.dart';

class ApiClient {
  final dio = Dio();
  late NewsService newServices;
  var logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2,
        // number of method calls to be displayed
        errorMethodCount: 8,
        // number of method calls if stacktrace is provided
        lineLength: 120,
        // width of the output
        colors: true,
        // Colorful log messages
        printEmojis: true,
        // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );

  ApiClient() {
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
          responseBody: true, requestBody: true, request: true));
    }

    try {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return null;
      };
    } catch (_) {}

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.data != null && options.data is FormData) {
            final FormData data = options.data as FormData;
            final files = data.files;

            for (int i = 0; i < files.length; i++) {
              String? path = files[i].value.filename;

              if (path == null) continue;

              if (path.toLowerCase().contains('.heic')) {
                final pathJpg = await HeicToJpg.convert(path);
                final name = p.basename(pathJpg!);
                files[i] = MapEntry(files[i].key,
                    MultipartFile.fromFileSync(path, filename: name));
              } else {
                final name = p.basename(path);
                files[i] = MapEntry(files[i].key,
                    MultipartFile.fromFileSync(path, filename: name));
              }
            }
          }
          logger.d(options.data);
          handler.next(options);
        },
        onError: (error, handler) async {
          final result = await (Connectivity().checkConnectivity());

          if (result == ConnectivityResult.none) {
            error.error =
                "No internet connection. Please check the connection again.";
            // ErrorPopup.show(MedicalApp.context!, error.error);
            //handler.reject(error);
            return;
          }

          try {
            final message = error.response?.data['data']['message']?.toString();
            error.error = message ?? "Processing failed. please try again.";
            handler.reject(error);
          } catch (_) {
            final msg = error.response?.data[0]['msg']?.toString();
            error.error = msg ?? "Processing failed. please try again.";
            handler.reject(error);
          }
        },
      ),
    );

    newServices =
        NewsService(dio, baseUrl: Constants.baseURL + Constants.versionAPI);
  }
}
