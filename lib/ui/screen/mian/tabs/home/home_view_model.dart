import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../data/cartrepo/cart-repo.dart';
import '../../../../../data/mainrepo/main-repo.dart';
import '../../../../../model/cart-response.dart';
import '../../../../../model/catogry-response.dart';
import '../../../../../model/prouductresponse.dart';
import '../../../../base/enums/base-screen-state.dart';
import 'home-state.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  final MainRepo mainRepo;
  final CartRepo cartRepo;
  // CartDM? latestcart;

  HomeViewModel(this.mainRepo, this.cartRepo) : super(HomeState());

  Future<void> loadCategory() async {
    emit(state.copyWith(catogrystate: BaseScreenState.loading));
    try {
      List<CatogryDM> category = await mainRepo.getallcatogry();
      emit(state.copyWith(
          catogry: category, catogrystate: BaseScreenState.success));
    } catch (e) {
      emit(state.copyWith(
          catogry: null,
          catogrystate: BaseScreenState.failuer,
          categoryErrorMessage: e.toString()));
    }
  }

  Future<void> loadProduct() async {
    emit(state.copyWith(productstate: BaseScreenState.loading));
    try {
      List<Products> product = await mainRepo.getprouduct();
      emit(state.copyWith(
          product: product, productstate: BaseScreenState.success));
    } catch (e) {
      emit(state.copyWith(
          product: null,
          productstate: BaseScreenState.failuer,
          productErrorMessage: e.toString()));
    }
  }
}
