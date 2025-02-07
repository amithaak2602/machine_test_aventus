import 'package:aventus_machine_test/bloc/cart_cubit/cart_cubit.dart';
import 'package:aventus_machine_test/model/cart_model.dart';
import 'package:aventus_machine_test/service/injection/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class CartRepository {
  static CollectionReference cartCollection =
      getFireStoreInstance()!.collection('cart');
  Future<DocumentReference> addToCart(CartModel cart) {
    return cartCollection.add(cart.toJson());
  }

  Future<void> updateCart(CartModel cart) async {
    return cartCollection.doc("${cart.id}").update(cart.toJson());
  }

  Future<void> delete(CartModel cart) async {
    return cartCollection.doc("${cart.id}").delete();
  }

  static FirebaseFirestore? getFireStoreInstance() {
    return FirebaseFirestore.instance;
  }

  Future<void> getCartData() async {
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("cart").get();
    final data = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    final result = data.map((e) => CartModel.fromJson(e)).toList();
    locator<CartCubit>().addCartList(result);
  }
}
