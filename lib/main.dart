import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade/features/watchlist/bloc/watchlist_event.dart';
import 'package:trade/features/watchlist/bloc/watchlit_bloc.dart';
import 'package:trade/features/watchlist/presentation/stock_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WatchlistBloc()..add(LoadStocksEvent()),
      child: MaterialApp(
        home: StockListPage(),
      ),
    );
  }
}