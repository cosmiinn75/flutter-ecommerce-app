import 'package:e_commerce/data/model/signup_body_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
      final SharedPreferences sharedPreferences;

      AuthRepo( {required this.sharedPreferences});
      Future<bool> registration(SignupBody signupBody) async {
        await Future.delayed(const Duration(seconds: 1));

        if (signupBody.name.isEmpty ||
            signupBody.phone.isEmpty ||
            signupBody.email.isEmpty ||
            signupBody.password.length < 6) {
          return false;
        }

        await sharedPreferences.setString(
          "token",
          "fake-registration-jwt-token",
        );

        await sharedPreferences.setString(
          "name",
          signupBody.name,
        );

        await sharedPreferences.setString(
          "email",
          signupBody.email,
        );

        await sharedPreferences.setString(
          "phone",
          signupBody.phone,
        );

        await sharedPreferences.setString(
          "password",
          signupBody.password,
        );

        return true;
      }


    // void  saveUserToken(String token){
    //     apiClient.token = token;
//          apiClient.updateHeader(token);
    //   }

  Future<bool> login(String email,String password) async {
    await Future.delayed(const Duration(seconds: 1));


    if (email == "test@test.com" &&
        password == "123456") {
      await sharedPreferences.setString(
        "token",
        "fake-login-jwt-token",
      );
      await sharedPreferences.setString("password","123456");
      await sharedPreferences.setString("email", "test@test.com");
      await sharedPreferences.setString("name", "cosmin");
      await sharedPreferences.setString("phone", "0123456789");
      return true;
    }

    return false;
    // return await apiClient.postData(signinUri , {'email': email , "password": password}});
  }

  String getUserToken(){
        return sharedPreferences.getString("token")!;
  }

  bool userLoggedIn(){
        return sharedPreferences.containsKey("token");}

  bool clearSharedData(){
        sharedPreferences.remove("token");
        sharedPreferences.remove("email");
        sharedPreferences.remove("password");
        sharedPreferences.remove("phone");
        // apiClient.token= '';

        return true;
  }
}