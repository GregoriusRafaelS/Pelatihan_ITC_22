import 'package:flutter/material.dart';

import '../modal/user.dart';
import '../page/detail_homes_screen.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      final args = settings.arguments as Users;
        return MaterialPageRoute(builder: (_) => DetailHomePageFuture(id: args.id, email: args.email, firstName: args.firstName, lastName: args.lastName, avatar: args.avatar,));
      case '/detailAcc':
      final args = settings.arguments as Users;
        return MaterialPageRoute(builder: (_) => DetailHomePageFuture(id: args.id, email: args.email, firstName: args.firstName, lastName: args.lastName, avatar: args.avatar,));
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text('Error page')),
      );
    });
  }
}