import 'package:e_commerce/data/model/user_model.dart';
import 'package:e_commerce/data/repository/user_repo.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {

  final UserRepo userRepo;
  late UserModel _userModel;

  UserController({required this.userRepo});

  UserModel get userModel=>_userModel;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  UserModel getUserData() {
    _isLoading = true;
    update();

    _userModel =  userRepo.getUser();
    _isLoading = false;
    update();
    return userModel;
  }



}