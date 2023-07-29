import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:insta_graph/cubits/authentication/authentication_state.dart';
import 'package:insta_graph/repository/api/authentication_repository.dart';
import 'package:insta_graph/services/auth_services.dart';

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

  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();

  final AuthServices authServices = AuthServices();

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
      final authModel = signUpResponse.dataModel?.result.first;

      if (authModel == null) {
        throw Exception('its fockin empty');
      }

      //emiting final data
      authServices.updateToken(authModel.token!);
      authServices.updateRefreshToken(authModel.refreshToken!);

      emit(
        state.copyWith(
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
      final loginResponce = await authenticationRepository.logIn(
        username: usernameController.text,
        password: passwordController.text,
      );

      final authModel = loginResponce.dataModel?.result.first;

      //emiting final data
      authServices.updateToken(authModel!.token!);
      authServices.updateRefreshToken(authModel.refreshToken!);

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
