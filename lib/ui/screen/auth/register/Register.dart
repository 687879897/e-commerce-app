import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di.dart';
import '../../../base/base-state/base-state.dart';
import '../../../base/enums/base-screen-state.dart';
import '../../../utils/dialog_utils.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/customtexttitleauth.dart';
import '../../../widgets/form_label.dart';
import '../../../widgets/logoauth..dart';
import '../../mian/main.dart';
import '../login/login.dart';
import 'register-view-model.dart';

class Register extends StatelessWidget {
  static const String routeName = 'register';
  RegisterViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, BaseState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state.state == BaseScreenState.loading) {
          showLoading(context);
        } else if (state.state == BaseScreenState.failuer) {
          hideLoading(context);
          showErrorDialog(context, "Registration Failed");
        } else if (state.state == BaseScreenState.success) {
          hideLoading(context);
          Navigator.pushReplacementNamed(context, Main.routeName);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 30),
                const LogoAuth(),
                const SizedBox(height: 20),
                const CustomTextTitleAuth(text: "Create Account"),
                const SizedBox(height: 10),
                const SizedBox(height: 15),
                Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FormLabelWidget(label: 'Full Name'),
                      const SizedBox(height: 24),
                      CustomTextFormField(
                        iconData: Icons.person_outline,
                        labeltext: "Full Name",
                        controller: viewModel.nameController,
                        hintText: 'enter your full name',
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        type: TextInputType.name,
                      ),
                      const SizedBox(height: 32),
                      FormLabelWidget(label: 'Email Address'),
                      const SizedBox(height: 24),
                      CustomTextFormField(
                        iconData: Icons.email_outlined,
                        labeltext: "Email",
                        controller: viewModel.emailController,
                        hintText: 'enter your email address',
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter your email';
                          }
                          var emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return 'Email format is not valid';
                          }
                          return null;
                        },
                        type: TextInputType.emailAddress,
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
                            return 'Please enter your password';
                          }
                          if (text.length < 6) {
                            return 'Password should be at least 6 characters.';
                          }
                          return null;
                        },
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                      const SizedBox(height: 32),
                      FormLabelWidget(label: 'Phone Number'),
                      const SizedBox(height: 24),
                      CustomTextFormField(
                        iconData: Icons.phone_outlined,
                        labeltext: "Phone",
                        controller: viewModel.phoneController,
                        hintText: 'enter your phone number',
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (!RegExp(r'^\d{10}$').hasMatch(text)) {
                            return 'Phone number format is not valid';
                          }
                          return null;
                        },
                        type: TextInputType.phone,
                      ),
                      const SizedBox(height: 30),
                      CustomButtonWidget(
                        title: 'Register',
                        onPressed: () {
                          viewModel.register();
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FormLabelWidget(label: "Already have an account? "),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Login.routeName);
                            },
                            child: FormLabelWidget(label: 'Login'),
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