import 'package:aventus_machine_test/screen/model/cart_model.dart';
import 'package:aventus_machine_test/screen/repository/cart_repository.dart';
import 'package:aventus_machine_test/screen/service/injection/injection.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@singleton
class CartCubit extends Cubit<CartModel> {
  CartCubit() : super(CartModel());
  void addCartList(List<CartModel> model) {
    emit(state.copyWith(cartList: model));
  }

  void addCart(CartModel cart) {
    emit(state.copyWith(cartModel: cart));
  }

  void updateOrderQty(CartModel cart, int qty, int index) async {
    final newState = List<CartModel>.from(state.cartList!).toList();
   double grandTotal = ((cart.price ?? 0) * (qty));
    newState.removeAt(index);
    cart = cart.copyWith(
        cartCount: qty,
        price: cart.price,
        total: grandTotal);
    newState.insert(index, cart);
    await locator<CartRepository>().updateCart(cart);
    emit(state
        .copyWith(
            cartList: newState,
            cartModel: cart,
            price: cart.price,
            cartCount: qty)
        .calcTotal());
  }
}
