import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/authrepo/auth-repo.dart';
import '../../../base/base-state/base-state.dart';
import '../../../base/enums/base-screen-state.dart';



@injectable
class LoginViewModel extends Cubit<BaseState>{
  AuthRepo authRepo;
  LoginViewModel(this.authRepo):super(BaseState());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login() async{
    if(!formKey.currentState!.validate()) return;
    try{
      emit(BaseState(state: BaseScreenState.loading));
      await authRepo.login(emailController.text, passwordController.text);
      emit(BaseState(state: BaseScreenState.success));
    }
    catch(e){
      emit(BaseState(state: BaseScreenState.failuer,errormassege: e.toString()));
    }

  }
}