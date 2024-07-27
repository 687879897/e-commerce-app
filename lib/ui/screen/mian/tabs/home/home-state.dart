import '../../../../../model/catogry-response.dart';
import '../../../../../model/prouductresponse.dart';
import '../../../../base/enums/base-screen-state.dart';
import '../../../../utils/app_assets.dart';

class HomeState {
  static const List<String> defaultAds = [AppAssets.ads, AppAssets.ads, AppAssets.ads];
  final List<String> ads;
  final BaseScreenState catogrystate;
  final List<CatogryDM>? catogry;
  final List<Products>? product;
  final String categoryErrorMessage;
  final String productErrorMessage;
  final BaseScreenState productstate;

  HomeState({
    this.ads = defaultAds,
    this.catogry,
    this.catogrystate = BaseScreenState.loading,
    this.product,
    this.categoryErrorMessage = '',
    this.productErrorMessage = '',
    this.productstate = BaseScreenState.loading,
  });

  HomeState copyWith({
    List<String>? ads,
    BaseScreenState? catogrystate,
    List<CatogryDM>? catogry,
    List<Products>? product,
    String? categoryErrorMessage,
    String? productErrorMessage,
    BaseScreenState? productstate,
  }) {
    return HomeState(
      ads: ads ?? this.ads,
      catogrystate: catogrystate ?? this.catogrystate,
      catogry: catogry ?? this.catogry,
      product: product ?? this.product,
      categoryErrorMessage: categoryErrorMessage ?? this.categoryErrorMessage,
      productErrorMessage: productErrorMessage ?? this.productErrorMessage,
      productstate: productstate ?? this.productstate,
    );
  }
}
