import 'package:aventus_machine_test/bloc/wish_list_cubit/wish_list_cubit.dart';
import 'package:aventus_machine_test/model/whishlist_model.dart';
import 'package:aventus_machine_test/service/injection/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';


@singleton
class WishListRepository {
  static CollectionReference cartCollection =
      getFireStoreInstance()!.collection('wishList');
  Future<DocumentReference> addToWishList(WishListModel model) {
    return cartCollection.add(model.toJson());
  }

  Future<void> updateCart(WishListModel model) async {
    return cartCollection.doc("${model.id}").update(model.toJson());
  }

  Future<void> delete(WishListModel model) async {
    return cartCollection.doc("${model.id}").delete();
  }

  static FirebaseFirestore? getFireStoreInstance() {
    return FirebaseFirestore.instance;
  }
  Future<void> getWishList() async {
    final QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection("wishList").get();
    final data = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    final result = data.map((e) => WishListModel.fromJson(e)).toList();
    locator<WishListCubit>().addWishList(result);
  }
}
