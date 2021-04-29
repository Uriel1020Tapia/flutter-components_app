import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      // body: ListView(children: _createItems()),
      body: ListView(children: _createItemsCorto()),
    );
  }

  // List<Widget> _createItems() {
  //   List<Widget> list = [];

  //   for (String opt in options) {
  //     final tempWidget = ListTile(
  //       title: Text(opt),
  //     );

  //     list
  //       ..add(tempWidget)
  //       ..add(Divider(
  //         height: 10,
  //         color: Colors.black,
  //       ));
  //   }
  //   return list;
  // }

  List<Widget> _createItemsCorto() {
    return options.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item),
            subtitle: Text('Subtitle'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {},
          ),
          Divider(
            height: 10,
            color: Colors.black,
          )
        ],
      );
    }).toList();
  }
}
