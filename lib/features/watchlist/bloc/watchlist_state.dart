import 'package:trade/models/stock_model.dart';

abstract class WatchlistState {}

class WatchListInitial extends WatchlistState {}

class WatchlistLoadingState extends WatchlistState {}

class WatchlistLoadedState extends WatchlistState {
  final List<StockModel> stocks;

  WatchlistLoadedState(this.stocks);
}

class WatchlistEditingState extends WatchlistState {
  final List<StockModel> stocks;
  final List<StockModel> originalStocks;

  WatchlistEditingState(this.stocks, this.originalStocks);
}

class WatchlistErrorState extends WatchlistState {
  final String message;

  WatchlistErrorState(this.message);
}
