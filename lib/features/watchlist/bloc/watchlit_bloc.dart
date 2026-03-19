import 'package:bloc/bloc.dart';
import 'package:trade/features/watchlist/bloc/watchlist_event.dart';
import 'package:trade/features/watchlist/bloc/watchlist_state.dart';
import 'package:trade/models/stock_model.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(WatchListInitial()) {
    on<LoadStocksEvent>(_onLoad);
    on<EnterEditModeEvent>(_onEnterEditMode);
    on<ReorderStocksEvent>(_onReorder);
    on<SaveOrderEvent>(_onSave);
    on<CancelEditEvent>(_onCancel);
    on<ExitEditModeEvent>(_onExitEditMode);
  }

  Future<void> _onLoad(
    LoadStocksEvent event,
    Emitter<WatchlistState> emit,
  ) async {
    emit(WatchlistLoadingState());

    try {
      await Future.delayed(const Duration(milliseconds: 500)); 

      final data = [
        StockModel(
          name: "RELIANCE",
          exchange: "NSE",
          price: 1374,
          change: -4,
          changePercent: 2,
          changePrice: 20,
        ),
        StockModel(
          name: "HDFC",
          exchange: "NSE",
          price: 966,
          change: 1,
          changePercent: 0.1,
          changePrice: 1,
        ),
        StockModel(
          name: "TCS",
          exchange: "NSE",
          price: 3300,
          change: -10,
          changePercent: 0.3,
          changePrice: 10,
        ),
        StockModel(
          name: "INFY",
          exchange: "NSE",
          price: 1500,
          change: 5,
          changePercent: 0.5,
          changePrice: 5,
        ),
      ];

      emit(WatchlistLoadedState(data));
    } catch (e) {
      emit(WatchlistErrorState("Failed to load stocks"));
    }
  }


  void _onEnterEditMode(
    EnterEditModeEvent event,
    Emitter<WatchlistState> emit,
  ) {
    if (state is WatchlistLoadedState) {
      final currentState = state as WatchlistLoadedState;

      emit(
        WatchlistEditingState(
          List.from(currentState.stocks),
          List.from(currentState.stocks),
        ),
      );
    }
  }

  void _onReorder(ReorderStocksEvent event, Emitter<WatchlistState> emit) {
    if (state is WatchlistEditingState) {
      final currentState = state as WatchlistEditingState;
      final updatedList = List<StockModel>.from(currentState.stocks);

      int newIndex = event.newIndex;

      if (event.oldIndex < newIndex) {
        newIndex -= 1;
      }

      final item = updatedList.removeAt(event.oldIndex);
      updatedList.insert(newIndex, item);

      emit(WatchlistEditingState(updatedList, currentState.originalStocks));
    }
  }

  void _onSave(SaveOrderEvent event, Emitter<WatchlistState> emit) {
    if (state is WatchlistEditingState) {
      final currentState = state as WatchlistEditingState;

      emit(WatchlistLoadedState(currentState.stocks));
    }
  }

 
  void _onCancel(CancelEditEvent event, Emitter<WatchlistState> emit) {
    if (state is WatchlistEditingState) {
      final currentState = state as WatchlistEditingState;

      emit(WatchlistLoadedState(currentState.originalStocks));
    }
  }

  void _onExitEditMode(ExitEditModeEvent event, Emitter<WatchlistState> emit) {
    if (state is WatchlistEditingState) {
      final currentState = state as WatchlistEditingState;

      emit(WatchlistLoadedState(currentState.stocks));
    }
  }
}
