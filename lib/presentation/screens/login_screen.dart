import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primehealth/business_logic/login_bloc/login_bloc.dart';
import 'package:primehealth/business_logic/login_bloc/login_state.dart';
import 'package:primehealth/presentation/widget/extention.dart';


class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider(
        create: (_) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.isLoggedIn) {
              Navigator.pushReplacementNamed(context, '/home');
            } else  {
              //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error.toString())));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                   // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Image.asset("assets/images/health.png"),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email',
                          border: OutlineInputBorder(  borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color:Colors.grey, width: 1),),
                          enabledBorder:  OutlineInputBorder(  borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color:Colors.grey, width: 1),),
                         focusedBorder: OutlineInputBorder(  borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color:Colors.grey, width: 1),),),
                           validator: (value){
                           if (!_emailController.text.isValidEmail()) {
                              return "Please enter a valid email";
                            }
              
                            return null;
              
                        },
                        
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: 'Password',
                           border:OutlineInputBorder(  borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color:Colors.grey, width: 1),),
                          enabledBorder:  OutlineInputBorder(  borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color:Colors.grey, width: 1),),
                         focusedBorder: OutlineInputBorder(  borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color:Colors.grey, width: 1),),),
                        obscureText: true,
                        validator: (value){
                         if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                            return 'Password must contain at least one special character';
                          }
                    return null;
                        },
                      ),
                      SizedBox(height: 24),
                      state.isLoading
                          ? CircularProgressIndicator()
                          : Container(
                            width: MediaQuery.sizeOf(context).width,
                            child: ElevatedButton(
                                onPressed: () {
                                  final email = _emailController.text;
                                  final password = _passwordController.text;
                                  if(!_formKey.currentState!.validate()) return;
                                  context.read<LoginCubit>().login(email, password);
                                },
                                child: Text('Login'),
                              ),
                          ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
