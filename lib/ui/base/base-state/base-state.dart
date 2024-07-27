

import 'package:injectable/injectable.dart';

import '../enums/base-screen-state.dart';
@injectable
class BaseState{
  String? errormassege;
   BaseScreenState state;
   BaseState({this.errormassege,this.state=BaseScreenState.notinitilized});

}