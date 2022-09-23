
import 'package:json_annotation/json_annotation.dart';

part 'meta_body.g.dart';

@JsonSerializable()
class MetaBody {

  @JsonKey(name:'pages')
  int ? page;


  @JsonKey(name:'limit')
  int ? limit;

  @JsonKey(name:'current_page')
  int ? currentPage;

  MetaBody();

  factory MetaBody.fromJson(Map<String, dynamic> json) =>
      _$MetaBodyFromJson(json);

  Map<String, dynamic> toJson() => _$MetaBodyToJson(this);
}