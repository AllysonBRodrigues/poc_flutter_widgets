import 'package:flutter/material.dart';
import 'package:flutter_app/model/Dog.dart';
import 'package:flutter_app/pages/dog_detail.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool _gridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 1"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                _gridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              setState(() {
                _gridView = true;
              });
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Pastor 1",
          "https://www.petlove.com.br/images/breeds/193103/profile/original/pastor_alemao-p.jpg?1532539270"),
      Dog("Pastor 2",
          "https://t1.ea.ltmcdn.com/pt/images/2/6/8/tudo_sobre_pastor_alemao_22862_600.jpg"),
      Dog("Pastor 3",
          "https://www.petlove.com.br/static/pets/dog/87561/medium_1522776438-photo.jpg"),
      Dog("Pastor 4", "https://img.olx.com.br/images/25/259924104323768.jpg"),
    ];

    if (_gridView) {
      return GridView.builder(
        itemCount: dogs.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return itemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 300,
        itemBuilder: (context, index) {
          return itemView(dogs, index);
        },
      );
    }
  }

  itemView(List<Dog> dogs, int index) {
    return GestureDetector(
      onTap: (){

         Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
                return DogDetail(dogs[index]);
              }));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _image(dogs[index].photo),
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black45, borderRadius: BorderRadius.circular(16)),
              child: Text(
                dogs[index].name,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _image(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}
