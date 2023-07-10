import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class BaseState extends Equatable {
  const BaseState({
    this.status = StateStatus.initial,
    this.message,
    this.error,
  });

  final StateStatus status;
  final String? message;
  final String? error;

  @override
  List<Object?> get props => [status, message, error];
}

enum StateStatus { initial, loading, loaded, error }

extension BaseStateExtension on BaseState {
  bool get isLoaded => status == StateStatus.loaded;
  bool get isError => status == StateStatus.error;
  bool get isLoading => status == StateStatus.loading;
  bool get isInitial => status == StateStatus.initial;
}
