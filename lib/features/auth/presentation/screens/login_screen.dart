import 'package:blog_app/constants/style.dart';
import 'package:blog_app/core/pallete.dart';
import 'package:blog_app/features/auth/presentation/widgets/input_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static route() => PageTransition(
        type: PageTransitionType.rightToLeft,
        child: LoginPage(),
      );

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool showPassword = true;

  bool showConfrimPassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 20.0,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //signup text
                  Text(
                    'Signin',
                    style: kSignupTextStyle,
                    textAlign: TextAlign.center,
                  ),

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

                  //submit button
                  SubmitButton(
                    buttonText: 'Signin',
                    onPressCallBack: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                  ),

                  //singin  reference
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Don\'t have an account? ',
                          children: [
                            TextSpan(
                              text: 'Sign up',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Pallete.gradient2),
                            ),
                          ],
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
