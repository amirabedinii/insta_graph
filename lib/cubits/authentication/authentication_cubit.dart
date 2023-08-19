import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:insta_graph/cubits/authentication/authentication_state.dart';
import 'package:insta_graph/network/exceptions.dart';
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

  Future<bool> signUp() async {
    // starting signUp
    emit(
      state.copyWith(
        signUpSubmitting: true,
      ),
    );

    try {
      log("sign up from cubit");      // getting response from server
      final signUpResponse = await authenticationRepository.signUp(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        username: usernameController.text,
        emailOrPhone: emailOrPhoneController.text,
        password: passwordController.text,
      );
      //getting data from response
      final  authModel = signUpResponse;
      log(authModel.toString());
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
      return true ;
    } on CustomHttpException catch (e) {
      emit(
        state.copyWith(
          message: e.message,
          signUpSubmitting: false,
        ),
      );
      log(e.message??"");
      return false ;
    } catch (e) {
      emit(
        state.copyWith(
          signUpSubmitting: false,
        ),
      );
      return false ;
    }
  
  }

  Future<bool> logIn() async {
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

      final authModel = loginResponce;

      if (authModel == null) {
        throw Exception('authmodel is empty');
      }

      //emiting final data
      authServices.updateToken(authModel.token!);
      authServices.updateRefreshToken(authModel.refreshToken!);

      emit(
        state.copyWith(
          logInSubmitting: false,
        ),
      );
      return true ;
    } on CustomHttpException catch (e) {
      emit(
        state.copyWith(
          message: e.message,
          logInSubmitting: false,
        ),
      );
  return false ;
    } catch (e) {
      emit(
        state.copyWith(
          logInSubmitting: false,
        ),
      );
    }
    return false ;
  }
}
