import 'package:flutter/material.dart';
import 'package:flutter_app/pages/page1.dart';
import 'package:flutter_app/pages/page2.dart';
import 'package:flutter_app/pages/page3.dart';
import 'package:flutter_app/widget/blue_button.dart';
import 'package:flutter_app/widget/drawer_list.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Flutter App",
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "TAB 1",
              ),
              Tab(
                text: "TAB 2",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _body(context),
            Container(
              color: Colors.green,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("Float Action Button");
          },
        ),
        drawer: DrawerList(),
      ),
    );
  }

  Text _text() {
    return Text(
      "Hello world",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        decoration: TextDecoration.underline,
      ),
    );
  }

  Container _body(context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  Container _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16),
      height: 300,
      child: PageView(
        children: <Widget>[
          _image(
              "https://www.petlove.com.br/images/breeds/193103/profile/original/pastor_alemao-p.jpg?1532539270"),
          _image(
              "https://t1.ea.ltmcdn.com/pt/images/2/6/8/tudo_sobre_pastor_alemao_22862_600.jpg"),
          _image(
              "https://image.cachorrogato.com.br/thumb/800/600/1/imagens/racas/imagem176.jpg"),
          _image(
              "https://www.petlove.com.br/static/pets/dog/87561/medium_1522776438-photo.jpg")
        ],
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton(
                    "ListView", () => _clickNavigation(context, Page1())),
                BlueButton("Page 2", () => _clickNavigation(context, Page2())),
                BlueButton("Page 3", () => _clickNavigation(context, Page3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", () => _clickSnack(context)),
                BlueButton("Dialog", () => _clickDialog(context)),
                BlueButton("Toast", _clickToast),
              ],
            )
          ],
        );
      },
    );
  }

  _clickNavigation(context, page) async {
    String response = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));

    print(">> $response");
  }

  _clickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Snack bar"),
      action: SnackBarAction(
        label: "ok",
        onPressed: () {
          print("ok");
        },
      ),
    ));
  }

  _clickDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Alerta"),
            content: Text("Proibido essa ação"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  _clickToast() {
    Fluttertoast.showToast(
        msg: "Toast flutter",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _image(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}
