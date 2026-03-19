import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade/features/watchlist/bloc/watchlist_event.dart';
import 'package:trade/features/watchlist/bloc/watchlist_state.dart';
import 'package:trade/features/watchlist/bloc/watchlit_bloc.dart';

class EditStocksPage extends StatelessWidget {
  const EditStocksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          context.read<WatchlistBloc>().add(CancelEditEvent());
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Stocks Order"),
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                context.read<WatchlistBloc>().add(CancelEditEvent());
                Navigator.pop(context);
              },
            ),
          ],
        ),

        body: BlocBuilder<WatchlistBloc, WatchlistState>(
          builder: (context, state) {
            if (state is WatchlistEditingState) {
              return ReorderableListView.builder(
                itemCount: state.stocks.length,

                onReorder: (oldIndex, newIndex) {
                  context.read<WatchlistBloc>().add(
                    ReorderStocksEvent(oldIndex, newIndex),
                  );
                },

                itemBuilder: (context, index) {
                  final stock = state.stocks[index];

                  return ListTile(
                    key: ValueKey(stock.name),
                    title: Text(stock.name),
                    subtitle: Text("${stock.exchange} • ₹${stock.price}"),
                    trailing: const Icon(Icons.drag_handle),
                  );
                },
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),

        floatingActionButton: FloatingActionButton.extended(
          label: const Text("Save"),
          icon: const Icon(Icons.check),
          onPressed: () {
            context.read<WatchlistBloc>().add(SaveOrderEvent());

            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
