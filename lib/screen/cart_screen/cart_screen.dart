import 'package:aventus_machine_test/bloc/cart_cubit/cart_cubit.dart';
import 'package:aventus_machine_test/bloc/product_cubit/product_cubit.dart';
import 'package:aventus_machine_test/common/colors.dart';
import 'package:aventus_machine_test/model/cart_model.dart';
import 'package:aventus_machine_test/model/product_model.dart';
import 'package:aventus_machine_test/screen/product_details_screen/product_detail_screen.dart';
import 'package:aventus_machine_test/screen/widget/custom_product_card.dart';
import 'package:aventus_machine_test/service/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartModel>(
      bloc: locator<CartCubit>(),
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
                (state.cartList ?? []).isEmpty
                    ? Center(
                        child: Text("No data"),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.cartList?.length,
                        itemBuilder: (context, index) {
                          return CustomProductCard(
                            tile: state.cartList?[index].name,
                            price: 'Rs ${state.cartList?[index].price}',
                            image: Image.network(
                              (state.cartList ?? [])[index].image.toString(),
                              fit: BoxFit.cover,
                            ),
                            isCart: true,
                            qty: 'Qty: ${state.cartList?[index].cartCount}',
                            onTap: () {
                              ProductModel model = ProductModel(
                                id: state.cartList?[index].productId,
                                price: '${state.cartList?[index].price}',
                                name: state.cartList?[index].name,
                                image: state.cartList?[index].image,
                                description: state.cartList?[index].description,
                              );
                              locator<ProductCubit>().addProduct(model);
                              final cart = state.cartList?[index];
                              locator<CartCubit>().addCart(cart ?? CartModel());
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProductDetailScreen(
                                  isFromCart: true,
                                  index: index,
                                );
                              }));
                            },
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
