import 'package:equatable/equatable.dart';

abstract class WidgetState extends Equatable {
  const WidgetState();
  Map<String, dynamic> toJson();
}