import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class BaseState extends Equatable {
  const BaseState({this.message});
  final String? message ;

 

  @override
  List<Object?> get props => [message];
}


