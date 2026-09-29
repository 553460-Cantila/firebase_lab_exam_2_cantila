import 'package:cloud_firestore/cloud_firestore.dart';

class CrudService {
  final CollectionReference foods =
      FirebaseFirestore.instance.collection('foods');

  // ADD
  Future<void> addFood(String name) async {
    await foods.add({
      'name': name,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // READ
  Stream<QuerySnapshot> getFoods() {
    return foods.orderBy('createdAt', descending: false).snapshots();
  }

  // UPDATE
  Future<void> updateFood(String id, String name) async {
    await foods.doc(id).update({
      'name': name,
    });
  }

  // DELETE
  Future<void> deleteFood(String id) async {
    await foods.doc(id).delete();
  }
}