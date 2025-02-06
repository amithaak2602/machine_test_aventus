import 'package:aventus_machine_test/screen/model/whishlist_model.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class WishListCubit extends Cubit<WishListModel> {
  WishListCubit() : super(WishListModel());
  void addWishList(List<WishListModel> wishList){
    emit(state.copyWith(wishList: wishList));
  }
}
