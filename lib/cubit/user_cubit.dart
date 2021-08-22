import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket/models/models.dart';
import 'package:foodmarket/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.signIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingError(result.message!));
    }
  }

  Future<void> signUp(User user, String password, {File? pictureFile}) async {
    ApiReturnValue<User> result =
        await UserServices.signUp(user, password, picturePath: pictureFile);

    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingError(result.message!));
    }
  }

  Future<void> uploadPhotoFile(File pictureFile) async {
    ApiReturnValue<String> result =
        await UserServices.uploadProfilePicture(pictureFile);

    if (result.value != null) {
      emit(UserLoaded((state as UserLoaded)
          .user
          .copyWith(picturePath: baseImageUrl + result.value!)));
    } else {
      emit(UserLoadingError(result.message!));
    }
  }
}
