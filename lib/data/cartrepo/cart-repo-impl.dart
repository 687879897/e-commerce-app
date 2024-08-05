import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import '../../model/cart-response.dart';

import '../../ui/utils/constants.dart';
import '../../ui/utils/end_points.dart';
import '../../utilis/sherd-perfrance/sherd-prefrance.dart';
import 'cart-repo.dart';
@Singleton(as: CartRepo)
class CartRepoImpl extends CartRepo{
  SharedPreference sherdPrefrance;

   StreamController<CartDm>streamController=StreamController.broadcast();
   CartRepoImpl(this.sherdPrefrance);


  @override
  Future addtocart(String id) async{
    Uri uri=Uri.parse(EndPoints.cart);
    var body={
      "productId": id
    };
    Response response = await post(uri,
      headers: {
    "token":(await sherdPrefrance.getToken())!
      },
      body: body);
    if(response.statusCode<=300&&response.statusCode>=200){
      getcart();
    }
    else {
      throw Constants.defaultErrorMessage;
    }
  }

  @override
  Future<CartDm> getcart()async {
    Uri uri=Uri.parse(EndPoints.cart);
    Response response = await get(uri,headers: {
      "token":(await sherdPrefrance.getToken())!
    });
    CartResponse myrsponse=CartResponse.fromJson(jsonDecode(response.body));
    if(response.statusCode<=300&&response.statusCode>=200&&myrsponse.data!=null){
      streamController.add(myrsponse.data!);
      return myrsponse.data!;
    }
    else {
      throw Constants.defaultErrorMessage;
    }

  }

  @override
  Future removefromcart(String id) async{
    Uri uri=Uri.parse("${EndPoints.cart}/$id");
    Response response = await delete(uri,headers: {
      "token":(await sherdPrefrance.getToken())!
    });
    if(response.statusCode<=300&&response.statusCode>=200){
      getcart();
    }
    else {
      throw Constants.defaultErrorMessage;
    }
  }

  @override
  Stream<CartDm> getstream() =>streamController.stream;

  @override
  Future<void> updatecart(String id, int count) async {
    Uri uri = Uri.parse("${EndPoints.cart}/$id");
    Map<String, dynamic> body = {
      "count": count,
    };

    final token = await sherdPrefrance.getToken();
    final response = await put(
      uri,
      headers: {
        "Content-Type": "application/json",
        "token": token!,
      },
      body: jsonEncode(body),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      // Optionally, parse and handle the response data
      // var responseData = jsonDecode(response.body);

      // Call the function to refresh the cart
      getcart();
    } else {
      // Handle specific error codes if needed
      throw Exception('Failed to update cart: ${response.statusCode}');
    }
}
}