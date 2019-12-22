

import 'package:flutter/material.dart';
import 'package:flutter_app/widget/blue_button.dart';

class Page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 2"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: BlueButton("Voltar", () => _backClick(context))
    );
  }

  _backClick(context) {
    Navigator.pop(context, "Tela 2");
  }

}