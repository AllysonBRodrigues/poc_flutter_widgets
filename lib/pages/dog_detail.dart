import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Dog.dart';

class DogDetail extends StatelessWidget{

  final Dog dog;

  DogDetail(this.dog);

 @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
      ),
      body: Image.network(dog.photo),
    );
  }

}