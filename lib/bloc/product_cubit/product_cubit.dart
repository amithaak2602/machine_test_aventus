import 'package:aventus_machine_test/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProductCubit extends Cubit<ProductModel> {
  ProductCubit() : super(ProductModel());
  void addProduct(ProductModel product) {
    emit(product);
  }
}
