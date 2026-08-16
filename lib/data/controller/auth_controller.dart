import 'package:e_commerce/data/model/response_model.dart';
import 'package:e_commerce/data/model/signup_body_model.dart';
import 'package:e_commerce/data/repository/auth_repo.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {

    final AuthRepo authRepo;

    AuthController({required this.authRepo});


    bool _isLoading = false;

    bool get isLoading => _isLoading;

Future<ResponseModel> registration(SignupBody signupBody) async{
      _isLoading = true;
      update();
      late ResponseModel responseModel;
      bool response = await authRepo.registration(signupBody);
          if(response){ // status code 200
            responseModel = ResponseModel(true, "fake-registration-jwt-token");

          }else {
            responseModel = ResponseModel(false, "Error");

          }
          _isLoading = false;
          update();
          return responseModel;
    }

    Future<ResponseModel> login(String email,String password) async{
      _isLoading = true;
      update();
      late ResponseModel responseModel;
      bool response = await authRepo.login(email, password);
      if(response){ // status code 200
        responseModel = ResponseModel(true, "fake-registration-jwt-token");

      }else {
        responseModel = ResponseModel(false, "Error");

      }
      _isLoading = false;
      update();
      return responseModel;
    }
    bool userLoggedIn(){
      return authRepo.userLoggedIn();
    }

}