import 'package:http/http.dart' as http;
import 'package:flutter_develop/http/API.dart';
import 'package:flutter_develop/http/home_banner_model.dart';
import 'dart:async';
import 'dart:convert';
class BannerDao{

  static Future<HomeBannerModel> fetch() async {
    print("11111");
    var homeModel=await http.get(API.HOME_BANNER_URL);
    print("22222");
    if (homeModel?.statusCode == 200) {
      print("200");
      Utf8Decoder utf8decoder = new Utf8Decoder();
      var result = json.decode(utf8decoder.convert(homeModel.bodyBytes));
      var model = HomeBannerModel.fromJson(result);
      if (model.errorCode == 0) {
        print(model.data.length);
        model.data.forEach((item){
          print(item.title);
        });
        return model;
      } else {

        throw new Exception("服务器异常");
      }
    } else {
      print("网络错误");
      throw new Exception("网络错误");
    }

  }




}