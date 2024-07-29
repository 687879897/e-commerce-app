import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart';
import '../../../base/base-state/base-state.dart';
import '../../../base/enums/base-screen-state.dart';


import '../../../../model/user-data.dart';
import '../../../utils/dialog_utils.dart';
import '../../../widgets/auth_widget/custom_text_form_field.dart';
import '../../../widgets/auth_widget/customtexttitleauth.dart';
import '../../../widgets/auth_widget/form_label.dart';
import '../../../widgets/main_widget/custom_button.dart';
import '../../mian/main.dart';
import 'login-view-model.dart';

class Login extends StatelessWidget {
  static const String routeName = 'login';
  LoginViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, BaseState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state.state == BaseScreenState.loading) {
          showLoading(context);
          hideLoading(context);
        } else if (state.state == BaseScreenState.failuer) {
          showErrorDialog(context, "failure");
        } else if (state.state == BaseScreenState.success) {
          UserData user = UserData(
            email: viewModel.emailController.text,
            passsword: viewModel.passwordController.text,
            name: 'Fetched Name',
            phone: 'Fetched Phone',
          );
          Navigator.pushReplacementNamed(context, Main.routeName, arguments: user);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 30,),
                const SizedBox(height: 20),
                const CustomTextTitleAuth(text: "Welcome Back"),
                const SizedBox(height: 10),
                const SizedBox(height: 15),
                Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FormLabelWidget(label: 'Email Address'),
                      const SizedBox(height: 24),
                      CustomTextFormField(
                          iconData: Icons.email_outlined,
                          labeltext: "Email",
                          controller: viewModel.emailController,
                          hintText: 'enter your email address',
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter email';
                            }
                            var emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(text);
                            if (!emailValid) {
                              return 'Email format is not valid';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress
                      ),
                      const SizedBox(height: 32),
                      FormLabelWidget(label: 'Password'),
                      const SizedBox(height: 24),
                      CustomTextFormField(
                        iconData: Icons.lock_outline,
                        labeltext: "Password",
                        hintText: 'enter your password',
                        controller: viewModel.passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter password ';
                          }
                          if (text.length < 6) {
                            return 'Password should be at least 6 chrs.';
                          }
                          return null;
                        },
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () {},
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: FormLabelWidget(label: 'Forget Password')
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomButtonWidget(
                          title: 'Login',
                          onPressed: () {
                            viewModel.login();
                          }
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FormLabelWidget(label: "Don't have an account ? "),
                          InkWell(
                            onTap: () {
                              // Navigator.pushNamed(context, Register.routeName);
                            },
                            child: FormLabelWidget(label: 'Create Account'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
