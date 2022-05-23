import 'package:equatable/equatable.dart';

class CurrencyModel extends Equatable {
  final String id;
  final String description;

  const CurrencyModel({
    required this.id,
    required this.description,
  });

  @override
  List<Object> get props => [id, description];

  @override
  String toString() => '$description ($id)';
}
