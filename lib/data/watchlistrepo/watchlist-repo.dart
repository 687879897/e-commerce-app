import 'package:e_commerce_friday_c9/model/watchlist-response.dart';

abstract class WatchListRepo{
  Future<List<WatchListDm>>getwatchlist();
  Future addtowatchlist(String id);
  Future removefromwatchlist(String id);
  Stream<List<WatchListDm>>getstream();

}