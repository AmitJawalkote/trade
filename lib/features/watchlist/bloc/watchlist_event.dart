abstract class WatchlistEvent {}

class LoadStocksEvent extends WatchlistEvent {}

class EnterEditModeEvent extends WatchlistEvent {}

class ExitEditModeEvent extends WatchlistEvent {}

class ReorderStocksEvent extends WatchlistEvent {
  final int oldIndex;
  final int newIndex;

  ReorderStocksEvent(this.oldIndex, this.newIndex);

 
}

class SaveOrderEvent extends WatchlistEvent {}

class CancelEditEvent extends WatchlistEvent {}
