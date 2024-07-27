import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/mainrepo/main-repo.dart';
import '../../../../../model/brand-response.dart';
import '../../../../../model/brandrespone.dart';
import '../../../../base/enums/base-screen-state.dart';
import 'categories-state.dart';

@injectable
class Brandviewmodel extends Cubit<BrandState> {
  final MainRepo mainRepo;

  Brandviewmodel(this.mainRepo) : super(BrandState());

  Future<void> loadbrand() async {
    emit(state.copyWith(brandState: BaseScreenState.loading));
    try {
      List<Data> brand = await mainRepo.getallbrand();
      emit(state.copyWith(
          brandData: brand, brandState: BaseScreenState.success));
    } catch (e) {
      emit(state.copyWith(
          brandData: null,
          brandState: BaseScreenState.failuer,
          brandErrorMessage: e.toString()));
    }
  }
  Future<void> loadspecificbrand() async {
    emit(state.copyWith(brandState: BaseScreenState.loading));
    try {
      List<Dm> brand = await mainRepo.getbrand();
      emit(state.copyWith(
          onebrand: brand, brandState: BaseScreenState.success));
    } catch (e) {
      emit(state.copyWith(
          brandData: null,
          brandState: BaseScreenState.failuer,
          brandErrorMessage: e.toString()));
    }
  }

}
