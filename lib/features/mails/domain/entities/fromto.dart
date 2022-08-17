import 'package:equatable/equatable.dart';

class FromTo extends Equatable {
  final String address;
  final String name;

  const FromTo({required this.address, required this.name});

  @override
  List<Object?> get props => [address, name];
}
