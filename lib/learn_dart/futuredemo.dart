void main(){
  timeout();
  _onRefresh();
  testFuture();
  testFutureCreate2();
  print("111221");
}
void testFuture(){
  Future future = new Future(() => null);
  future.then((_){
    print("then");
  });
}

// 刷新时数据请求
Future<Null> _onRefresh() async {
  return await Future.delayed(Duration(seconds: 3), () {
    print("过了三秒了");

  });
}

  timeout() async {
  print("async");
  return 'hello world';
}

void testFutureCreate2(){
  Future f2 = new Future(() => null);
  Future f1 = new Future(() => null);
  Future f3 = new Future(() => null);
  f1.then((_) => print("1"));
  f2.then((_) => print("2"));
  f3.then((_) => print("3"));
}

//【结论】: 创建多个Future，执行顺序和和创建Future的先后顺序有关，如果只是单独的调用then，
//没有嵌套使用的话，和调用then的先后顺序无关。

//【结论】: 首先执行顺序和创建Future的先后顺序有关，如果遇到多个 then 嵌套，先执行外面的  then，
//然后再执行里面的then，如果then里面还有创建Future，要等到then执行完毕，之后执行Future。
