import 'package:bloc/bloc.dart';
import 'package:insta_graph/cubits/authentication/authentication_state.dart';

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
  
}
