import 'package:flutter/cupertino.dart';
import 'package:flutter_components_app/src/pages/alert_page.dart';
import 'package:flutter_components_app/src/pages/animated_container.dart';
import 'package:flutter_components_app/src/pages/avatar_page.dart';
import 'package:flutter_components_app/src/pages/card_page.dart';
import 'package:flutter_components_app/src/pages/home_page.dart';
import 'package:flutter_components_app/src/pages/input_page.dart';
import 'package:flutter_components_app/src/pages/listview_page.dart';
import 'package:flutter_components_app/src/pages/slider_page.dart';

final routes = <String, WidgetBuilder>{
  '/': (context) => HomePage(),
  'alert': (context) => AlertPage(),
  'avatar': (context) => AvatarPage(),
  'card': (context) => CardPage(),
  'animated_container': (context) => AnimatedContainerPage(),
  'inputs': (context) => InputPage(),
  'sliders': (context) => SliderPage(),
  'list': (context) => ListPage(),
};

Map<String, WidgetBuilder> getApplicationRoutes() => routes;
