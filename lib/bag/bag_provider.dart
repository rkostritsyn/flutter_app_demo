import 'package:flutter/material.dart';
import 'package:flutter_app_demo/bag/bag_bloc.dart';

class BagProvider extends InheritedWidget {
  final BagBloc bagBloc;

  BagProvider({Key key, BagBloc bagBloc, Widget child}) :
        bagBloc = bagBloc ?? BagBloc(), super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static BagBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BagProvider) as BagProvider)
      .bagBloc;
}