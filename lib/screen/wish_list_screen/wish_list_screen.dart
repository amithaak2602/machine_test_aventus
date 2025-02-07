import 'package:aventus_machine_test/bloc/wish_list_cubit/wish_list_cubit.dart';
import 'package:aventus_machine_test/screen/common/colors.dart';
import 'package:aventus_machine_test/model/whishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../service/injection/injection.dart';
import '../widget/custom_product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListModel>(
      bloc: locator<WishListCubit>(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: StaticColors.staticWhite,
          appBar: AppBar(
            backgroundColor: StaticColors.staticWhite,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              children: [
               ( state.wishList??[]).isEmpty?Center(child: Text("No data"),): ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.wishList?.length,
                  itemBuilder: (context, index) {
                    return CustomProductCard(
                      tile: state.wishList?[index].name,
                      price: 'Rs ${state.wishList?[index].price}',
                      image: Image.network(
                        (state.wishList)![index].image.toString(),
                        fit: BoxFit.cover,
                      ),
                      isCart: false,
                      isWishList: true,
                      onTap: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
