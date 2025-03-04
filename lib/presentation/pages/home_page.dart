import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/item/item_bloc.dart';
import '../blocs/item/item_event.dart';
import '../blocs/item/item_state.dart';
import '../widgets/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text('Items List')),
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemInitial) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<ItemBloc>().add(LoadItems());
                },
                child: const Text('Load Data'),
              ),
            );
          }

          if (state is ItemLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ItemError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message, style: const TextStyle(color: Colors.red), textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ItemBloc>().add(LoadItems());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is ItemLoaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return ItemCard(item: state.items[index]);
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
