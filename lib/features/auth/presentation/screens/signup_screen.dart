import 'package:blog_app/common/loader.dart';
import 'package:blog_app/constants/style.dart';
import 'package:blog_app/core/pallete.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentation/screens/login_screen.dart';
import 'package:blog_app/features/auth/presentation/widgets/input_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/mySnackBar.dart';
import 'package:blog_app/features/auth/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool showPassword = true;

  bool showConfrimPassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(12.0),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  showSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Loader();
                }

                return Form(
                  key: _formKey,
                  child: Column(
                    spacing: 20.0,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //signup text
                      Text(
                        'Signup',
                        style: kSignupTextStyle,
                        textAlign: TextAlign.center,
                      ),

                      //name
                      InputField(
                          textController: nameController,
                          label: 'Name',
                          validateFunction: (value) {
                            if (value == null || value.isEmpty) {
                              return 'name field is required';
                            }
                            return null;
                          }),

                      //Email
                      InputField(
                          textController: emailController,
                          label: 'Email',
                          validateFunction: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email field is required';
                            }
                            return null;
                          }),

                      //Password
                      InputField(
                          isObscure: showPassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              icon: Icon(showPassword
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye)),
                          textController: passwordController,
                          label: 'password',
                          validateFunction: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password field is required';
                            }
                            return null;
                          }),

                      //confirm password
                      InputField(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showConfrimPassword = !showConfrimPassword;
                            });
                          },
                          icon: Icon(showConfrimPassword
                              ? Icons.visibility_off
                              : Icons.remove_red_eye),
                        ),
                        isObscure: showConfrimPassword,
                        textController: confirmPasswordController,
                        label: 'Confirm Password',
                        validateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'confirm password field is required';
                          }
                          return null;
                        },
                      ),

                      //submit button
                      SubmitButton(
                        buttonText: 'Signup',
                        onPressCallBack: () {
                          if (_formKey.currentState!.validate()) {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              showSnackBar(context, 'Password didnt match');
                            } else {
                              context.read<AuthBloc>().add(AuthSignup(
                                  name: nameController.text.trim(),
                                  email: emailController.text,
                                  password: passwordController.text));
                              nameController.clear();
                              passwordController.clear();
                              confirmPasswordController.clear();
                              emailController.clear();
                            }
                          }
                        },
                      ),

                      //login reference
                      GestureDetector(
                        onTap: () => Navigator.push(context, LoginPage.route()),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Already have an account? ',
                              children: [
                                TextSpan(
                                    text: 'Sign in',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(color: Pallete.gradient2))
                              ],
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
