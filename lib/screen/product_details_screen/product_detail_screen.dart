import 'package:aventus_machine_test/bloc/cart_cubit/cart_cubit.dart';
import 'package:aventus_machine_test/bloc/product_cubit/product_cubit.dart';
import 'package:aventus_machine_test/bloc/wish_list_cubit/wish_list_cubit.dart';
import 'package:aventus_machine_test/common/colors.dart';
import 'package:aventus_machine_test/common/common.dart';
import 'package:aventus_machine_test/model/cart_model.dart';
import 'package:aventus_machine_test/model/product_model.dart';
import 'package:aventus_machine_test/model/whishlist_model.dart';
import 'package:aventus_machine_test/repository/cart_repository.dart';
import 'package:aventus_machine_test/repository/wish_list_repository.dart';
import 'package:aventus_machine_test/service/injection/injection.dart';
import 'package:aventus_machine_test/screen/widget/save_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ProductDetailScreen extends StatefulWidget {
  final bool isFromCart;
  final bool isWishListCart;
  final int? index;

  const ProductDetailScreen(
      {super.key,
      this.isWishListCart = false,
      this.isFromCart = false,
      this.index});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isInWishList = false;
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListModel>(
      bloc: locator<WishListCubit>(),
      builder: (context, wishlistModel) {
        return BlocBuilder<CartCubit, CartModel>(
          bloc: locator<CartCubit>(),
          builder: (context, cart) {
            return BlocBuilder<ProductCubit, ProductModel>(
              bloc: locator<ProductCubit>(),
              builder: (context, state) {
                return Scaffold(
                  backgroundColor: StaticColors.staticWhite,
                  appBar: AppBar(
                    backgroundColor: StaticColors.staticWhite,
                    actions: [
                      if (widget.isFromCart)
                        GestureDetector(
                          child: Icon(
                            Icons.delete_outlined,
                            color: StaticColors.staticBackground,
                          ),
                          onTap: () async {
                            await locator<CartRepository>()
                                .delete(cart.cartModel ?? CartModel());
                            Common.toast("Item deleted from the cart");
                            await locator<CartRepository>().getCartData();
                            Navigator.pop(context);
                          },
                        ),
                      if (!widget.isFromCart && !widget.isWishListCart)
                        GestureDetector(
                          child: Icon(
                            Iconsax.heart,
                            color: _isInWishList
                                ? StaticColors.staticdeepRed
                                : StaticColors.staticBackground,
                          ),
                          onTap: () async {
                            int index = (wishlistModel.wishList ?? [])
                                .indexWhere((data) {
                              return data.productId
                                  .toString()
                                  .toLowerCase()
                                  .contains(state.id.toString().toLowerCase());
                            });
                            if (index < 0) {
                              WishListModel wishList = WishListModel(
                                name: state.name,
                                price: state.price,
                                description: state.description,
                                image: state.image,
                                productId: state.id,
                              );
                              await locator<WishListRepository>()
                                  .addToWishList(wishList)
                                  .then((value) {
                                if (value.id.isNotEmpty) {
                                  value.update(({"id": value.id}));
                                }
                                Common.toast("Item added to wishlist");
                              });
                              await locator<WishListRepository>().getWishList();
                              setState(() {
                                _isInWishList = true;
                              });
                            } else {
                              Common.toast(
                                  "Item already exist in your wishlist");
                            }
                          },
                        ),
                      SizedBox(
                        width: 5.w,
                      ),
                      if (!widget.isFromCart && !widget.isWishListCart)
                        GestureDetector(
                          child: Icon(
                            Iconsax.shopping_cart,
                            color: StaticColors.staticBackground,
                          ),
                          onTap: () async {
                            int index =
                                (cart.cartList ?? []).indexWhere((data) {
                              return data.productId
                                  .toString()
                                  .toLowerCase()
                                  .contains(state.id.toString().toLowerCase());
                            });
                            if (index < 0) {
                              CartModel cartData = CartModel(
                                name: state.name,
                                price: double.parse(state.price.toString()),
                                total: double.parse(state.price.toString()),
                                description: state.description,
                                image: state.image,
                                productId: state.id,
                                cartCount: int.parse(qty.toString()),
                              );
                              await locator<CartRepository>()
                                  .addToCart(cartData)
                                  .then((value) {
                                if (value.id.isNotEmpty) {
                                  value.update(({"id": value.id}));
                                }
                                Common.toast("Item added to cart");
                              });
                              await locator<CartRepository>().getCartData();
                            } else {
                              Common.toast("Item already added in your cart");
                            }
                          },
                        ),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  ),
                  body: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: SizedBox(
                                  height: 40.h,
                                  child: Image.network(state.image.toString())),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.isFromCart
                                        ? "Rs ${cart.cartModel?.total}"
                                        : "Rs ${state.price}",
                                    style: TextStyle(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  if (widget.isFromCart)
                                    Row(
                                      children: [
                                        GestureDetector(
                                          child: Icon(
                                            Icons.add_circle,
                                            color: Colors.black,
                                            size: 24.sp,
                                          ),
                                          onTap: () async {
                                            qty =
                                                cart.cartModel?.cartCount ?? 0;
                                            qty++;
                                            locator<CartCubit>().updateOrderQty(
                                                cart.cartModel ?? CartModel(),
                                                qty,
                                                widget.index ?? 0);
                                            await locator<CartRepository>()
                                                .getCartData();
                                            setState(() {});
                                          },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Text(
                                            "Qty: ${cart.cartModel?.cartCount}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          child: Icon(Icons.remove_circle,
                                              color: Colors.black, size: 24.sp),
                                          onTap: () async {
                                            qty =
                                                cart.cartModel?.cartCount ?? 0;
                                            qty--;
                                            locator<CartCubit>().updateOrderQty(
                                                cart.cartModel ?? CartModel(),
                                                qty,
                                                widget.index ?? 0);
                                            await locator<CartRepository>()
                                                .getCartData();
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Text(
                                state.description ?? "",
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
                        CustomButton(
                          title: "Buy Now",
                          textColor: Colors.white,
                          btnColor: Color(0xff0a1732),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
