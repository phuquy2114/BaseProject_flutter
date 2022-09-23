
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofitapi_flutter/remote/service/response/base_response.dart';

import '../../../models/food_model.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewAllResponse extends BaseResponse{

  @JsonKey(name: 'data')
  List<FoodModel>? dataList;

  NewAllResponse();

  factory NewAllResponse.fromJson(Map<String, dynamic> json) =>
      _$NewAllResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewAllResponseToJson(this);
}
