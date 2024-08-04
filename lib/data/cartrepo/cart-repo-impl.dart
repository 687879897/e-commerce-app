import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
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

   StreamController<CartDM>streamController=StreamController();
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
  Future<CartDM> getcart()async {
    Uri uri=Uri.parse(EndPoints.cart);
    Response response = await get(uri,headers: {
      "token":(await sherdPrefrance.getToken())!
    });
    getResponse myrsponse=getResponse.fromJson(jsonDecode(response.body));
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
  Stream<CartDM> getstream() =>streamController.stream;

}