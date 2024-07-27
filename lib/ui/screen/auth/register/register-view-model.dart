import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/authrepo/auth-repo.dart';
import '../../../base/base-state/base-state.dart';
import '../../../base/enums/base-screen-state.dart';

@injectable
class RegisterViewModel extends Cubit<BaseState> {
  final AuthRepo authRepo;

  RegisterViewModel(this.authRepo) : super(BaseState());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void register() async {
    if (!formKey.currentState!.validate()) return;
    try {
      emit(BaseState(state: BaseScreenState.loading));
      await authRepo.register(
        email: emailController.text,
        password: passwordController.text,
        username: nameController.text,
        phonenumber: phoneController.text,
      );
      emit(BaseState(state: BaseScreenState.success));
    } catch (e) {
      emit(BaseState(
        state: BaseScreenState.failuer,
        errormassege: e.toString(),
      ));
    }
  }
}
