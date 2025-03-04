import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import '../../data/clients/item_data_client.dart';
import '../../domain/repositories/item_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await dotenv.load();

  final client =
      Client()
        ..setEndpoint(dotenv.env['APPWRITE_ENDPOINT']!)
        ..setProject(dotenv.env['APPWRITE_PROJECT_ID']!);

  sl.registerLazySingleton(() => client);
  sl.registerLazySingleton(() => Databases(client));

  // Data Client
  sl.registerLazySingleton<ItemDataClient>(
    () => ItemDataClient(
      databases: sl(),
      databaseId: dotenv.env['APPWRITE_DATABASE_ID']!,
      collectionId: dotenv.env['APPWRITE_COLLECTION_ID']!,
    ),
  );

  // Repository
  sl.registerLazySingleton<ItemRepository>(() => ItemRepository(dataClient: sl()));
}
