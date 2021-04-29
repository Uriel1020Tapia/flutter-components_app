import 'package:flutter/material.dart';
// import 'package:flutter_components_app/src/pages/alert_page.dart';

import 'package:flutter_components_app/src/providers/menu_provider.dart';
import 'package:flutter_components_app/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    // print(menuProvider.options);
    // menuProvider.loadData().then((options) {});
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createListItems(snapshot.data, context),
        );
      },
    );
    // return ListView(
    //   children: _createListItems(),
    // );
  }

  List<Widget> _createListItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.blue),
        onTap: () {
          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          // Navigator.push(context, route);
          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      options..add(widgetTemp)..add(Divider());
    });
    return options;
  }
}
