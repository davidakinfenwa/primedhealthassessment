import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool isLoggedIn;
  final String? error;

  const LoginState({
    this.isLoading = false,
    this.isLoggedIn = false,
    this.error,
  });

  @override
  List<Object?> get props => [isLoading, isLoggedIn, error];
}
