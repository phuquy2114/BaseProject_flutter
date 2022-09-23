// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaBody _$MetaBodyFromJson(Map<String, dynamic> json) => MetaBody()
  ..page = json['pages'] as int?
  ..limit = json['limit'] as int?
  ..currentPage = json['current_page'] as int?;

Map<String, dynamic> _$MetaBodyToJson(MetaBody instance) => <String, dynamic>{
      'pages': instance.page,
      'limit': instance.limit,
      'current_page': instance.currentPage,
    };
