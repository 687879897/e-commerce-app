
import '../../../../../model/cart-response.dart';
import '../../../../../model/catogry-response.dart';
import '../../../../../model/get-product-response.dart';
import '../../../../../model/prouductresponse.dart';
import '../../../../../model/watchlist-response.dart';
import '../../../../base/enums/base-screen-state.dart';
import '../../../../utils/app_assets.dart';

class HomeState {
  static const List<String> defaultAds = AppAssets.ads;
  final List<String> ads;
  final BaseScreenState catogrystate;
  final List<CatogryDM>? catogry;
  final List<ProductDM>? product;
  final String categoryErrorMessage;
  final String productErrorMessage;
  final BaseScreenState productstate;
  final CartDm? cartDm;
  final List<WatchListDm>? watchList;


  HomeState({
    this.ads = defaultAds,
    this.catogry,
    this.catogrystate = BaseScreenState.loading,
    this.product,
    this.categoryErrorMessage = '',
    this.productErrorMessage = '',
    this.productstate = BaseScreenState.loading,
    this.cartDm,
    this.watchList
  });

  HomeState copyWith({
    List<String>? ads,
    BaseScreenState? catogrystate,
    List<CatogryDM>? catogry,
    List<ProductDM>? product,
    String? categoryErrorMessage,
    String? productErrorMessage,
    BaseScreenState? productstate,
    CartDm? cartDm,
    List<WatchListDm>? watchList,

  }) {
    return HomeState(
      ads: ads ?? this.ads,
      catogrystate: catogrystate ?? this.catogrystate,
      catogry: catogry ?? this.catogry,
      product: product ?? this.product,
      categoryErrorMessage: categoryErrorMessage ?? this.categoryErrorMessage,
      productErrorMessage: productErrorMessage ?? this.productErrorMessage,
      productstate: productstate ?? this.productstate,
      cartDm: cartDm??this.cartDm,
        watchList:watchList??this.watchList
    );
  }
}
