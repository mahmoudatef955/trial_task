import 'package:appwrite/appwrite.dart';
import 'package:trial_task/domain/models/item.dart';

class ItemDataClient {
  final Databases _databases;
  final String _databaseId;
  final String _collectionId;

  ItemDataClient({required Databases databases, required String databaseId, required String collectionId})
    : _databases = databases,
      _databaseId = databaseId,
      _collectionId = collectionId;

  Future<List<Item>> getItems() async {
    try {
      final response = await _databases.listDocuments(databaseId: _databaseId, collectionId: _collectionId);

      final items =
          response.documents.map((doc) {
            return Item.fromJson(doc.data..addAll({'\$id': doc.$id}));
          }).toList();

      return items;
    } on AppwriteException catch (e) {
      throw Exception(e.message ?? 'An error occurred while fetching items');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
