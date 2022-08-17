import 'package:equatable/equatable.dart';

class Domain extends Equatable {
  final String id;
  final String domain;

  const Domain({required this.id, required this.domain});

  @override
  List<Object?> get props => [id, domain];
}
