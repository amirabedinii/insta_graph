import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:insta_graph/cubits/authentication/authentication_state.dart';
import 'package:insta_graph/repository/api/authentication_repository.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit()
      : super(
           AuthenticationState(
            signUpWithFacebook: false,
            signUpSubmitting: false,
            logInSubmitting: false,
            logOutSubmitting: false,
          ),
        );

  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();

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
        ),
      );
    } on HttpException catch (e) {
      emit(
        state.copyWith(
          message: e.message,
          signUpSubmitting: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          signUpSubmitting: false,
        ),
      );
    }
  }

  Future logIn() async {
    // starting logIn
    emit(
      state.copyWith(
        logInSubmitting: true,
      ),
    );

    try {
      // getting response from server
      final logInResponse = await authenticationRepository.logIn(
        username: usernameController.text,
        password: passwordController.text,
      );

      //emiting final data
      emit(
        state.copyWith(
          logInSubmitting: false,
        ),
      );
    } on HttpException catch (e) {
      emit(
        state.copyWith(
          message: e.message,
          logInSubmitting: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          logInSubmitting: false,
        ),
      );
    }
  }
}
