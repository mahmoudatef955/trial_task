import 'package:trial_task/data/clients/item_data_client.dart';
import 'package:trial_task/domain/models/item.dart';

class ItemRepository {
  final ItemDataClient _dataClient;

  ItemRepository({required ItemDataClient dataClient}) : _dataClient = dataClient;

  Future<List<Item>> getItems() async {
    try {
      return await _dataClient.getItems();
    } catch (e) {
      rethrow;
    }
  }
}
