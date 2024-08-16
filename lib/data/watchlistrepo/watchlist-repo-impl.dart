import 'dart:async';
import 'dart:convert';
import 'package:e_commerce_friday_c9/data/watchlistrepo/watchlist-repo.dart';
import 'package:e_commerce_friday_c9/model/watchlist-response.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import '../../model/cart-response.dart';

import '../../ui/utils/constants.dart';
import '../../ui/utils/end_points.dart';
import '../../utilis/sherd-perfrance/sherd-prefrance.dart';
@Singleton(as: WatchListRepo)
class WatchListRepoImpl extends WatchListRepo{
  SharedPreference sherdPrefrance;

   StreamController<List<WatchListDm>>streamController=StreamController.broadcast();
  WatchListRepoImpl(this.sherdPrefrance);


  @override
  Future addtowatchlist(String id) async{
    Uri uri=Uri.parse(EndPoints.watchlist);
    var body={
      "productId": id
    };
    Response response = await post(uri,
      headers: {
    "token":(await sherdPrefrance.getToken())!
      },
      body: body);
    if(response.statusCode<=300&&response.statusCode>=200){
      getwatchlist();
    }
    else {
      throw Constants.defaultErrorMessage;
    }
  }

  @override
  Future<List<WatchListDm>> getwatchlist()async {
    Uri uri=Uri.parse(EndPoints.watchlist);
    Response response = await get(uri,headers: {
      "token":(await sherdPrefrance.getToken())!
    });
    WatchListResponse myrsponse=WatchListResponse.fromJson(jsonDecode(response.body));
    if(response.statusCode<=300&&response.statusCode>=200&&myrsponse.data!=null){
      streamController.add(myrsponse.data!);
      return myrsponse.data!;
    }
    else {
      throw Constants.defaultErrorMessage;
    }

  }

  @override
  Future removefromwatchlist(String id) async{
    Uri uri=Uri.parse("${EndPoints.watchlist}/$id");
    Response response = await delete(uri,headers: {
      "token":(await sherdPrefrance.getToken())!
    });
    if(response.statusCode<=300&&response.statusCode>=200){
      getwatchlist();
    }
    else {
      throw Constants.defaultErrorMessage;
    }
  }

  @override
  Stream<List<WatchListDm>> getstream() =>streamController.stream;



}