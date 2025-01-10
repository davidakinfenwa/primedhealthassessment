import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:primehealth/business_logic/login_bloc/login_bloc.dart';
import 'package:primehealth/business_logic/login_bloc/login_state.dart';

void main() {
  group('LoginCubit Tests', () {
    late LoginCubit loginCubit;

    setUp(() {
      loginCubit = LoginCubit();
    });

    tearDown(() {
      loginCubit.close();
    });

    blocTest<LoginCubit, LoginState>(
      'emits [isLoading: true, isLoggedIn: true] when login is successful',
      build: () => loginCubit,
      act: (cubit) => cubit.login('test@example.com', 'password@123'),
      wait: const Duration(seconds: 2), 
      expect: () => [
        const LoginState(isLoading: true),
        const LoginState(isLoggedIn: true),
      ],
    );

    blocTest<LoginCubit, LoginState>(
      'emits [isLoading: true, error: Invalid email or password] when login fails',
      build: () => loginCubit,
      act: (cubit) => cubit.login('testexample.com', '123'),
      wait: const Duration(seconds: 2),
      expect: () => [
        const LoginState(isLoading: true),
        const LoginState(error: 'Invalid email or password'),
      ],
    );
  });
}
