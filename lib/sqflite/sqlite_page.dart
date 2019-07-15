import 'package:flutter/material.dart';
import 'package:flutter_develop/sqflite/Book.dart';
import 'package:toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SqlitePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SqlitePageState();
  }
}

class _SqlitePageState extends State<SqlitePage> {
  bool showPhoneClose = false;
  bool showPasswordClose = false;
  String phone;
  String password;

  TextEditingController _onPhoneController = TextEditingController();
  TextEditingController _onPasswordController = TextEditingController();
  SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPrefenences();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 50, bottom: 10),
            child: Image.asset(
              "images/logo.png",
              width: 100,
              height: 100,
            ),
          ),
          createInput(_onPhoneChange, _onPhoneController, Icons.phone_android,
              showPhoneClose, true),
          createInput(_onPasswordChange, _onPasswordController,
              Icons.lock_outline, showPasswordClose, false),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 45,
                    child: RaisedButton(
                      onPressed: _save,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        '存放',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.lightBlue,
                      highlightColor: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  height: 45,
                  child: RaisedButton(
                    onPressed: _get,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      '读取',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.lightBlue,
                    highlightColor: Colors.blue,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  createInput(ValueChanged<String> onChanged, TextEditingController controller,
      IconData icon, bool close, bool isPhone) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextField(
            obscureText: isPhone ? false : true,
            style: TextStyle(fontSize: 16),
            maxLines: 1,
            onChanged: onChanged,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(0, 5, 50, 5),
              border: InputBorder.none,
              icon: Icon(
                icon,
                color: Colors.blue,
              ),
              labelText: isPhone ? '请输入用户名' : '请输入密码',
            ),
          ),
          close
              ? Container(
                  margin: EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      controller.clear();
                      setState(() {
                        isPhone
                            ? showPhoneClose = false
                            : showPasswordClose = false;
                      });
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  void initSharedPrefenences() async {
    prefs = await SharedPreferences.getInstance();
  }

  void _onPhoneChange(String text) {
    phone = text;
    if (text.length > 0) {
      setState(() {
        showPhoneClose = true;
      });
    } else {
      setState(() {
        showPhoneClose = false;
      });
    }
  }

  void _onPasswordChange(String text) {
    password = text;
    if (text.length > 0) {
      setState(() {
        showPasswordClose = true;
      });
    } else {
      setState(() {
        showPasswordClose = false;
      });
    }
  }

  void _save() {
//    var  userName = prefs.getString('user_name') ?? '';

    insertData();
    prefs.setString('user_name', phone);
    Toast.show('设置成功', context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
  }

  void _get() {
    getBookName();

    var userName = prefs.getString('user_name') ?? '';
    Toast.show('获取成功' + userName, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
  }

//获取编号为1的书
  void insertData() async {
    BookSqlite bookSqlite = BookSqlite();
    await bookSqlite.openSqlite();
    await bookSqlite.insert(new Book(0, "flutter大全0", "flutter", 0.1, "中国出版"));
    await bookSqlite.insert(new Book(1, "flutter大全1", "flutter", 0.1, "中国出版"));
    await bookSqlite.insert(new Book(2, "flutter大全2", "flutter", 0.1, "中国出版"));
    await bookSqlite.insert(new Book(3, "flutter大全3", "flutter", 0.1, "中国出版"));
    //切记用完就close
    await bookSqlite.close();
  }

//获取编号为1的书
  void getBookName() async {
    BookSqlite bookSqlite = BookSqlite();
    await bookSqlite.openSqlite();
    Book book = await bookSqlite.getBook(1);
    await bookSqlite.close();
    setState(() {
//    bookName = book.name;

      _onPhoneController.text = book.name;
    });
  }
}
