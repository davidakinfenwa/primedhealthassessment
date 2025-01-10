// import 'login_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  void login(String email, String password) {
    emit(LoginState(isLoading: true));

    // Simulate login validation
    Future.delayed(Duration(seconds: 2), () {
      if (email.contains('@') && password.length >= 8) {
        emit(LoginState(isLoggedIn: true));
      } else {
        emit(LoginState(error: 'Invalid email or password'));
      }
    });
  }
}