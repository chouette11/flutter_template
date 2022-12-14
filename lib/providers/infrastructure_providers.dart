import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/entity/example/example_entity.dart';
import 'package:flutter_template/repositories/example_repository.dart';

/// Firestoreのインスタンスを保持するプロバイダ
final firebaseFirestoreProvider = Provider((_) => FirebaseFirestore.instance);

///コレクション名のプロバイダ
final examplesCollectionNameProvider = Provider((_) => 'examples');

///コレクションReferenceのプロバイダ
final examplesCollectionRefProvider =
    Provider<CollectionReference<Map<String, dynamic>>>((ref) => ref
        .watch(firebaseFirestoreProvider)
        .collection(ref.watch(examplesCollectionNameProvider)));

/// StreamProvider
final StreamProvider<List<ExampleEntity>> examplesStreamProvider =
    StreamProvider<List<ExampleEntity>>((ref) {
  return ref.read(exampleRepositoryProvider).getExampleStream();
});
