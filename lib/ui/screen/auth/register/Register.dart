import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart';
import '../../../../model/user-data.dart';
import '../../../base/base-state/base-state.dart';
import '../../../base/enums/base-screen-state.dart';
import '../../../utils/dialog_utils.dart';

import '../../../widgets/auth_widget/custom_text_form_field.dart';
import '../../../widgets/auth_widget/customtexttitleauth.dart';
import '../../../widgets/auth_widget/form_label.dart';
import '../../../widgets/main_widget/custom_button.dart';
import '../../mian/main.dart';
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
        }
        if (state.state == BaseScreenState.failuer) {
          hideLoading(context);
          showErrorDialog(context, state.errormassege!);
        }
        if (state.state == BaseScreenState.success) {
          Navigator.pushReplacementNamed(context, Main.routeName,
              arguments: UserData(
                  email: viewModel.emailController.text,
                  passsword: viewModel.passwordController.text,
                  name: viewModel.nameController.text,
                  phone: viewModel.phoneController.text));
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            const SizedBox(height: 20),
            const CustomTextTitleAuth(text: "Welcome"),
            const SizedBox(height: 10),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormLabelWidget(label: 'Full Name'),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                            iconData: Icons.person_2_outlined,
                            labeltext: "Name",
                            hintText: 'enter your full name',
                            controller: viewModel.nameController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter full name';
                              }
                              return null;
                            },
                            type: TextInputType.name),
                        const SizedBox(
                          height: 32,
                        ),
                        FormLabelWidget(label: 'Email Address'),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                            iconData: Icons.email_outlined,
                            labeltext: "email",
                            hintText: 'enter your email address',
                            controller: viewModel.emailController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter email';
                              }
                              var emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(text);
                              if (!emailValid) {
                                return 'email format not valid';
                              }

                              return null;
                            },
                            type: TextInputType.emailAddress),
                        const SizedBox(
                          height: 32,
                        ),
                        FormLabelWidget(label: 'Mobile Number'),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                            iconData: Icons.phone_android_outlined,
                            labeltext: "Phone",
                            hintText: 'enter your mobile number',
                            controller: viewModel.phoneController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter mobile number';
                              }
                              if (text.trim().length < 10) {
                                return 'Phone number should be at least 10 numbers.';
                              }
                              return null;
                            },
                            type: TextInputType.phone),
                        const SizedBox(
                          height: 32,
                        ),
                        FormLabelWidget(label: 'Password'),
                        const SizedBox(
                          height: 24,
                        ),
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
                              return 'Phone number should be at least 6 chrs.';
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        FormLabelWidget(label: 'Password Confirmation'),
                        const SizedBox(
                          height: 24,
                        ),
                        CustomTextFormField(
                          iconData: Icons.lock_outline,
                          labeltext: "Repassword",
                          hintText: 're-enter your password confirmation',
                          controller: viewModel.repasswordController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please re-enter password ';
                            }
                            if (text != viewModel.passwordController.text) {
                              return "Password doesn't match.";
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButtonWidget(
                            title: 'Sign Up',
                            onPressed: () {
                              viewModel.register();
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}