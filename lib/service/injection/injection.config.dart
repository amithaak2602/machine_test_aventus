// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aventus_machine_test/bloc/cart_cubit/cart_cubit.dart' as _i556;
import 'package:aventus_machine_test/bloc/product_cubit/product_cubit.dart'
    as _i638;
import 'package:aventus_machine_test/bloc/user_cubit/user_cubit.dart' as _i271;
import 'package:aventus_machine_test/bloc/wish_list_cubit/wish_list_cubit.dart'
    as _i534;
import 'package:aventus_machine_test/repository/cart_repository.dart' as _i698;
import 'package:aventus_machine_test/repository/login_repository.dart' as _i575;
import 'package:aventus_machine_test/repository/product_repository.dart'
    as _i846;
import 'package:aventus_machine_test/repository/wish_list_repository.dart'
    as _i407;
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
    gh.singleton<_i556.CartCubit>(() => _i556.CartCubit());
    gh.singleton<_i638.ProductCubit>(() => _i638.ProductCubit());
    gh.singleton<_i271.UserCubit>(() => _i271.UserCubit());
    gh.singleton<_i534.WishListCubit>(() => _i534.WishListCubit());
    gh.singleton<_i698.CartRepository>(() => _i698.CartRepository());
    gh.singleton<_i575.LoginRepository>(() => _i575.LoginRepository());
    gh.singleton<_i846.ProductRepository>(() => _i846.ProductRepository());
    gh.singleton<_i407.WishListRepository>(() => _i407.WishListRepository());
    return this;
  }
}
