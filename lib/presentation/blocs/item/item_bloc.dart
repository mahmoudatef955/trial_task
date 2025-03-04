import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/item_repository.dart';
import 'item_event.dart';
import 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository _repository;

  ItemBloc({required ItemRepository repository}) : _repository = repository, super(ItemInitial()) {
    on<LoadItems>(_onLoadItems);
  }

  Future<void> _onLoadItems(LoadItems event, Emitter<ItemState> emit) async {
    try {
      emit(ItemLoading());
      final items = await _repository.getItems();
      emit(ItemLoaded(items));
    } catch (e) {
      emit(ItemError(e.toString()));
    }
  }
}
