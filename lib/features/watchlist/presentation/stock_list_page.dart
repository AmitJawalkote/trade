import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade/features/watchlist/bloc/watchlist_event.dart';
import 'package:trade/features/watchlist/bloc/watchlist_state.dart';
import 'package:trade/features/watchlist/bloc/watchlit_bloc.dart';
import 'package:trade/features/watchlist/presentation/edit_stocks_order_page.dart';

class StockListPage extends StatelessWidget {
  const StockListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Watchlist")),

      body: BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistLoadingState || state is WatchListInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is WatchlistLoadedState) {
            return ListView.builder(
              itemCount: state.stocks.length,
              itemBuilder: (context, index) {
                final stock = state.stocks[index];

                return ListTile(
                  key: ValueKey(stock.name),
                  title: Text(stock.name),
                  subtitle: Text("${stock.exchange} • ₹${stock.price}"),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () {
          context.read<WatchlistBloc>().add(EnterEditModeEvent());

          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const EditStocksPage()),
          );
        },
      ),
    );
  }
}
