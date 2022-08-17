import 'package:json_annotation/json_annotation.dart';
import 'package:riseup_mail/features/mails/domain/entities/fromto.dart';

part 'fromto_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FromToModel extends FromTo {
  const FromToModel({
    required String address,
    required String name,
  }) : super(
          address: address,
          name: name,
        );

  factory FromToModel.fromJson(Map<String, dynamic> json) => _$FromToModelFromJson(json);

  Map<String, dynamic> toJson() => _$FromToModelToJson(this);
}
