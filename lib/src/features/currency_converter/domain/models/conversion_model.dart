import 'package:equatable/equatable.dart';

class ConversionModel extends Equatable {
  final num amount;
  final String from;
  final String to;

  const ConversionModel({
    required this.amount,
    required this.from,
    required this.to,
  });

  @override
  List<Object?> get props => [amount, from, to];

  Map<String, dynamic> toJson() => {
        'amount': amount.toString(),
        'from': from,
        'to': to,
      };
}
