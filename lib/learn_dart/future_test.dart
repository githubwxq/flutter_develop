import 'dart:async';
import 'package:flutter_develop/dio/HttpGo.dart';
import 'dart:ui';
printDailyNewsDigest() async {
  String news = await gatherNewsReports();
  print(news);

//  getData();

}

void getData() {

  var postUrl = 'http://www.wanandroid.com/user/login';
  postHttp() {
    var getUrl = 'http://www.wanandroid.com/article/list/0/json';
    getHttp() {
//      FormData formData = FormData.from({'cid': 60});
      HttpGo.getInstance().get(
        getUrl,
            (data) {

          print(data);


        },
//        params: formData,
      );
    }
  }

}

main() {
  printDailyNewsDigest();
  printWinningLotteryNumbers();
  printWeatherForecast();
  printBaseballScore();
}

printWinningLotteryNumbers() {
  print('Winning lotto numbers: [23, 63, 87, 26, 2]');
}

printWeatherForecast() {
  print("Tomorrow's forecast: 70F, sunny.");
}

printBaseballScore() {
  print('Baseball score: Red Sox 10, Yankees 0');
}

const news = '<gathered news goes here>';

Duration oneSecond = const Duration(seconds: 1);

final newsStream = new Stream.periodic(oneSecond, (_) => news);

Future gatherNewsReports() => newsStream.first;