import 'package:equatable/equatable.dart';

class LoadingEvent extends Equatable {
  final bool isLoading;
  final String? message;

  const LoadingEvent({required this.isLoading, this.message});
  @override
  List<Object?> get props => [isLoading, message];
}
