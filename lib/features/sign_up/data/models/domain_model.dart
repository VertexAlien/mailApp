import 'package:json_annotation/json_annotation.dart';
import 'package:riseup_mail/features/sign_up/domain/entities/domain.dart';

part 'domain_model.g.dart';

@JsonSerializable()
class DomainModel extends Domain {
  const DomainModel({
    required String id,
    required String domain,
  }) : super(
          id: id,
          domain: domain,
        );

  factory DomainModel.fromJson(Map<String, dynamic> json) => _$DomainModelFromJson(json);

  Map<String, dynamic> toJson() => _$DomainModelToJson(this);
}
