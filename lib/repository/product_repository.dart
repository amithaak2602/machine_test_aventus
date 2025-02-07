import 'package:aventus_machine_test/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProductRepository {
   Future<List<ProductModel>> getProducts() async {
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("products").get();
    final data = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    final result = data.map((e) => ProductModel.fromJson(e)).toList();
    return result;
  }
}
