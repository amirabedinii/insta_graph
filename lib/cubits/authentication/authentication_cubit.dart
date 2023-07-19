import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:insta_graph/cubits/authentication/authentication_state.dart';
import 'package:insta_graph/models/state/base_state.dart';
import 'package:insta_graph/repository/api/authentication_repository.dart';
import 'package:insta_graph/services/di_service/di_service.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit()
      : super(
          const AuthenticationState(
            signUpWithFacebook: false,
            signUpSubmitting: false,
            logInSubmitting: false,
            logOutSubmitting: false,
          ),
        );

  AuthenticationRepository get authenticationRepository =>
      DIService().getModel<AuthenticationRepository>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailOrPhoneController = TextEditingController();
  final passwordController = TextEditingController();

  Future signUp() async {
    // starting signUp
    emit(
      state.copyWith(
        signUpSubmitting: true,
        status: StateStatus.loading,
      ),
    );

    try {
      // getting response from server
      final signUpResponse = await authenticationRepository.signUp(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        username: usernameController.text,
        emailOrPhone: emailOrPhoneController.text,
        password: passwordController.text,
      );

      //getting data from response
      final userModel = signUpResponse.dataModel?.result.first;

      //emiting final data
      emit(
        state.copyWith(
          userModel: userModel,
          signUpSubmitting: false,
          status: StateStatus.loaded,
        ),
      );
    } on HttpException catch (e) {
      emit(
        state.copyWith(
          message: e.message,
          signUpSubmitting: false,
          status: StateStatus.error,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          signUpSubmitting: false,
          status: StateStatus.error,
        ),
      );
    }
  }
}
