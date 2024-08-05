import 'package:e_commerce_friday_c9/model/cart-response.dart';

class ProductDateilsState {

  final CartDm? cartDm;

  ProductDateilsState({

    this.cartDm,
  });

  ProductDateilsState copyWith({

    CartDm? cartDm,
  }) {
    return ProductDateilsState(

        cartDm: cartDm??this.cartDm
    );
  }
}