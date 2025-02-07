import 'package:aventus_machine_test/bloc/product_cubit/product_cubit.dart';
import 'package:aventus_machine_test/bloc/wish_list_cubit/wish_list_cubit.dart';
import 'package:aventus_machine_test/screen/common/colors.dart';
import 'package:aventus_machine_test/model/product_model.dart';
import 'package:aventus_machine_test/screen/product_details_screen/product_detail_screen.dart';
import 'package:aventus_machine_test/repository/cart_repository.dart';
import 'package:aventus_machine_test/repository/product_repository.dart';
import 'package:aventus_machine_test/repository/wish_list_repository.dart';
import 'package:aventus_machine_test/service/injection/injection.dart';
import 'package:aventus_machine_test/screen/widget/custom_product_card.dart';
import 'package:aventus_machine_test/screen/widget/custom_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _search = TextEditingController();
  List<ProductModel> productList = [];
  List<ProductModel> allProductList = [];
  bool load = false;
  @override
  void initState() {
    fetchProduct();
    super.initState();
  }

  void fetchProduct() async {
    setState(() {
      load = true;
    });
    await locator<CartRepository>().getCartData();
    await locator<WishListRepository>().getWishList();
    allProductList = await locator<ProductRepository>().getProducts();
    productList = allProductList;
    load = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StaticColors.staticWhite,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 9.h),
        child: Column(
          children: [
            SizedBox(
              height: 7.h,
              child: CustomSearchbar(
                controller: _search,
                label: "Search Products",
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    productList = allProductList.where((data) {
                      return data.name
                          .toString()
                          .toLowerCase()
                          .contains(value.toString().toLowerCase());
                    }).toList();
                  } else {
                    productList = allProductList;
                  }
                  setState(() {});
                },
              ),
            ),
            load
                ? Column(
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Center(
                        child: SizedBox(
                          width: 5.w,
                          height: 3.5.h,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          return CustomProductCard(
                            tile: productList[index].name,
                            price: 'Rs ${productList[index].price}',
                            image: Image.network(
                              productList[index].image.toString(),
                              fit: BoxFit.cover,
                            ),
                            onTap: () {
                              locator<ProductCubit>()
                                  .addProduct(productList[index]);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProductDetailScreen(
                                  isFromCart: false,
                                  isWishListCart: false,
                                );
                              }));
                            },
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
