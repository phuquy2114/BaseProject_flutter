
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'response/news_response.dart';

part 'news_services.g.dart';

@RestApi()
abstract class NewsService {
  factory NewsService(Dio dio, {String baseUrl}) = _NewsService;

  @GET('/new/all')
  Future<NewAllResponse> getNewAll();
}