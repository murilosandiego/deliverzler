import 'dart:io';

import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/core/data/local/image_picker_caller/i_image_picker_caller.dart';

abstract class IProfileRepo {
  Future<File> pickProfileImage(PickSource pickSource);

  Future<String> uploadProfileImage(File imageFile);

  Future<void> updateProfileImage(String imageUrl);

  Future<void> updateProfileData(User userModel);
}
