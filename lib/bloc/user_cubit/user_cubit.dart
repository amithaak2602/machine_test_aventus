import 'package:aventus_machine_test/model/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserCubit extends Cubit<UserModel> {
  UserCubit() : super(UserModel());
  void addUser(UserModel user) {
    emit(user);
  }
}
