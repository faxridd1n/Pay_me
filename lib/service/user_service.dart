

import 'package:dio/dio.dart';

import '../core/api/api.dart';
import '../core/config/dio_config.dart';
import '../models/userCardModel.dart';
import 'log_service.dart';
class UserService {
  static final UserService _inheritance = UserService._init();

  static UserService get inheritance => _inheritance;

  UserService._init();

  static Future<List<UserModel>?> getUsers() async {

    try {
      Response res =
      await DioConfig.inheritance.createRequest().get(Urls.getUsers);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200) {
        List<UserModel> userList = [];
        for (var e in (res.data as List)) {
          userList.add(UserModel.fromJson(e));
        }

        return userList;
      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
    }
    return null;
  }


  static Future<bool> createUser(UserModel user) async {
    try {
      Response res = await DioConfig.inheritance
          .createRequest()
          .post(Urls.addUser,
          data: {
            "name": user.ism,
            "kartaRaqam":user.kartaRaqam,
            "komp":user.komp,
            "amalQilishMuddati":user.amalQilishMuddati,
          });
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }


  static Future<bool> deleteUser(String id,) async {
    try {
      Response res = await DioConfig.inheritance
          .createRequest()
          .delete(Urls.deleteUser + id,);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }


  
  static Future<bool> editUser(String id,UserModel user) async {
    try {
      Response res = await DioConfig.inheritance
          .createRequest().put(Urls.editUser + id,data: {
            "name":user.ism,
            
          
          });
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }
}