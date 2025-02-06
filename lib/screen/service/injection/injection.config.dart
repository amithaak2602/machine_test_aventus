// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aventus_machine_test/screen/bloc/cart_cubit/cart_cubit.dart'
    as _i541;
import 'package:aventus_machine_test/screen/bloc/product_cubit/product_cubit.dart'
    as _i203;
import 'package:aventus_machine_test/screen/bloc/user_cubit/user_cubit.dart'
    as _i857;
import 'package:aventus_machine_test/screen/bloc/wish_list_cubit/wish_list_cubit.dart'
    as _i458;
import 'package:aventus_machine_test/screen/repository/cart_repository.dart'
    as _i228;
import 'package:aventus_machine_test/screen/repository/login_repository.dart'
    as _i98;
import 'package:aventus_machine_test/screen/repository/product_repository.dart'
    as _i35;
import 'package:aventus_machine_test/screen/repository/wish_list_repository.dart'
    as _i949;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i541.CartCubit>(() => _i541.CartCubit());
    gh.singleton<_i203.ProductCubit>(() => _i203.ProductCubit());
    gh.singleton<_i458.WishListCubit>(() => _i458.WishListCubit());
    gh.singleton<_i228.CartRepository>(() => _i228.CartRepository());
    gh.singleton<_i98.LoginRepository>(() => _i98.LoginRepository());
    gh.singleton<_i35.ProductRepository>(() => _i35.ProductRepository());
    gh.singleton<_i949.WishListRepository>(() => _i949.WishListRepository());
    gh.singleton<_i857.UserCubit>(() => _i857.UserCubit());
    return this;
  }
}
