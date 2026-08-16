import 'package:e_commerce/data/model/user_model.dart';

class UserRepo {


    UserModel getUser(){
      return UserModel(name: "cosmin", email: "test@test.com", phone: "0123456789" , id: 1 ,orderCount: 1);
    }
}