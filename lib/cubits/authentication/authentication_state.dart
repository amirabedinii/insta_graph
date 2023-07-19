import 'package:insta_graph/models/api/authentication/user_model.dart';
import 'package:insta_graph/models/state/base_state.dart';

class AuthenticationState extends BaseState {
  final UserModel? userModel;
  final String? token;
  final bool signUpWithFacebook;
  final bool signUpSubmitting;
  final bool logInSubmitting;
  final bool logOutSubmitting;

  const AuthenticationState({
    String? error,
    StateStatus status = StateStatus.initial,
    String? message,
    this.userModel,
    this.token,
    required this.signUpWithFacebook,
    required this.signUpSubmitting,
    required this.logInSubmitting,
    required this.logOutSubmitting,
  }) : super(
          error: error,
          status: status,
          message: message,
        );

  AuthenticationState copyWith({
    StateStatus? status,
    String? error,
    String? message,
    UserModel? userModel,
    String? token,
    bool? signUpWithFacebook,
    bool? signUpSubmitting,
    bool? logInSubmitting,
    bool? logOutSubmitting,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      error: error ?? this.error,
      message: message ?? this.message,
      userModel: userModel ?? this.userModel,
      token: token ?? this.token,
      signUpWithFacebook: signUpWithFacebook ?? this.signUpWithFacebook,
      signUpSubmitting: signUpSubmitting ?? this.signUpSubmitting,
      logInSubmitting: logInSubmitting ?? this.logInSubmitting,
      logOutSubmitting: logOutSubmitting ?? this.logOutSubmitting,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userModel': userModel?.toJson(),
      'token': token,
      'signUpSubmitting': signUpSubmitting,
      'logInSubmitting': logInSubmitting,
      'logOutSubmitting': logOutSubmitting,
    };
  }

  factory AuthenticationState.fromJson(Map<String, dynamic> map) {
    return AuthenticationState(
      userModel: map['userModel'] != null
          ? UserModel.fromJson(map['userModel'] as Map<String, dynamic>)
          : null,
      token: map['token'] as String,
      signUpWithFacebook: map['signUpWithFacebook'] as bool,
      signUpSubmitting: map['signUpSubmitting'] as bool,
      logInSubmitting: map['logInSubmitting'] as bool,
      logOutSubmitting: map['logOutSubmitting'] as bool,
    );
  }

  @override
  List<Object?> get props => [
        userModel,
        token,
        signUpWithFacebook,
        signUpSubmitting,
        logInSubmitting,
        logOutSubmitting,
      ];
}