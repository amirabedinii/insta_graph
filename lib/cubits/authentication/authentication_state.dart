import 'package:insta_graph/models/state/base_state.dart';

class AuthenticationState extends BaseState {
  final bool signUpWithFacebook;
  final bool signUpSubmitting;
  final bool logInSubmitting;
  final bool logOutSubmitting;

  const AuthenticationState({
    String? message,
    required this.signUpWithFacebook,
    required this.signUpSubmitting,
    required this.logInSubmitting,
    required this.logOutSubmitting,
  }) : super(
          message: message,
        );

  AuthenticationState copyWith({
    String? message,
    bool? signUpWithFacebook,
    bool? signUpSubmitting,
    bool? logInSubmitting,
    bool? logOutSubmitting,
    int? step,
  }) {
    return AuthenticationState(
      message: message,
      signUpWithFacebook: signUpWithFacebook ?? this.signUpWithFacebook,
      signUpSubmitting: signUpSubmitting ?? this.signUpSubmitting,
      logInSubmitting: logInSubmitting ?? this.logInSubmitting,
      logOutSubmitting: logOutSubmitting ?? this.logOutSubmitting,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'signUpSubmitting': signUpSubmitting,
      'logInSubmitting': logInSubmitting,
      'logOutSubmitting': logOutSubmitting,
    };
  }

  factory AuthenticationState.fromJson(Map<String, dynamic> map) {
    return AuthenticationState(
      signUpWithFacebook: map['signUpWithFacebook'] as bool,
      signUpSubmitting: map['signUpSubmitting'] as bool,
      logInSubmitting: map['logInSubmitting'] as bool,
      logOutSubmitting: map['logOutSubmitting'] as bool,
    );
  }

  @override
  List<Object?> get props => [
        signUpWithFacebook,
        signUpSubmitting,
        logInSubmitting,
        logOutSubmitting,
      ];
}
