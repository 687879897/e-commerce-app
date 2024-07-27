import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'main-view-model-state.dart';

@injectable
class MainViewModel extends Cubit<MainScreenState> {
  MainViewModel() : super(MainScreenState());

  void setcurrenttabindex(int newindex) {
    emit(state.copyWith(currentTabIndex: newindex));
  }

}
