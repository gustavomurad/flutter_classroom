import 'package:equatable/equatable.dart';

class RateModel extends Equatable {
  final String id;
  final num amount;

  const RateModel({
    required this.id,
    required this.amount,
  });

  @override
  List<Object> get props => [id, amount];
}
