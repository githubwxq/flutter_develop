import 'dart:convert';
import 'package:dio/dio.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';
class HttpGo{
  static final String GET = "get";
  static final String POST = "post";
  static final String DATA = "data";
  static final String CODE = "errorCode";

  Dio dio;
  static HttpGo _instance;

  static HttpGo getInstance() {
    print("getInstance");
    if (_instance == null) {
      _instance = HttpGo();
    }
    return _instance;
  }
  HttpGo() {
    dio = Dio(Options(
      /*baseUrl: "http://192.168.5.6:8085",*/
      headers: {'platform': 'android', 'version': 11.0},
      connectTimeout: 10000,
      receiveTimeout: 100000,
    ));
  }

//get请求
  get(String url, Function successCallBack,
      {params, Function errorCallBack}) async {
    print("get");

    _requstHttp(url, successCallBack, GET, params, errorCallBack);
  }



  //post请求
  post(String url, Function successCallBack,
      {params, Function errorCallBack}) async {
    _requstHttp(url, successCallBack, POST, params, errorCallBack);
  }


  _requstHttp(String url, Function successCallBack,
      [String method, FormData params, Function errorCallBack]) async {
    String errorMsg="";
    int code;

    try {
      print("try");
      Response response;
      _addStartHttpInterceptor(dio);

      if (method == GET) {
        if (params != null && params.isNotEmpty) {
          response = await dio.get(url, data: params);
        } else {
          response = await dio.get(url);
        }
      } else if (method == POST) {
        if (params != null && params.isNotEmpty) {
          response = await dio.post(url, data: params);
        } else {
          response = await dio.post(url);
        }
      }

      code = response.statusCode;
      if (code != 200) {
        errorMsg = '错误码：' + code.toString() + '，' + response.data.toString();
        _error(errorCallBack, errorMsg);
        return;
      }

      String dataStr = json.encode(response.data);
      Map<String, dynamic> dataMap = json.decode(dataStr);
      if (dataMap != null && dataMap[CODE] != 0) {  // 根据返回数据格式取出对应得错误
        errorMsg =
            '错误码：' + dataMap[CODE].toString() + '，' + response.data.toString();
        _error(errorCallBack, errorMsg);
        return;
      }

      if (successCallBack != null) {
         successCallBack(dataMap[DATA]);
      }

    }catch (exception) {
      print("exception");
      _error(errorCallBack, exception.toString());
    }

   }

  _error(Function errorCallBack, String error) {
//    Fluttertoast.showToast(
//        msg: error.toString(),
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.CENTER);
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }

  _addStartHttpInterceptor(Dio dio) {
    dio.interceptor.request.onSend = (Options options) {
      // 在请求被发送之前做一些事情   比如加密的一些操作 或者添加token等参数 对head 或者请求参数进行加工处理
      Map<String, dynamic> headers = options.headers;
      Map<String, dynamic> body = options.data;
      /*request['token'] = '1111111111';
      headers['addParam'] = 'aaaaaaaaaaaaaaa';*/
      return options;
    };
  }





}






