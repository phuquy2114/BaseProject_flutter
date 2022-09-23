// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAllResponse _$NewAllResponseFromJson(Map<String, dynamic> json) =>
    NewAllResponse()
      ..error = json['error'] as int?
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..dataList = (json['data'] as List<dynamic>?)
          ?.map((e) => FoodModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$NewAllResponseToJson(NewAllResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'status': instance.status,
      'message': instance.message,
      'data': instance.dataList,
    };
