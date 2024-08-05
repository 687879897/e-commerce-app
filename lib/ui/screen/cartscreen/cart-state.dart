import 'package:e_commerce_friday_c9/model/cart-response.dart';

class CartState {

  final CartDm? cartDm;

  CartState({

    this.cartDm,
  });

  CartState copyWith({

    CartDm? cartDm,
  }) {
    return CartState(

        cartDm: cartDm??this.cartDm
    );
  }
}