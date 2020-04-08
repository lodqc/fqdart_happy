import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeState>(
                adapter: null,
                slots: <String, Dependent<HomeState>>{
                }),
            middleware: <Middleware<HomeState>>[
            ],);

}

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    bottomNavigationBar: BottomNavigationBar(
      items: [
        getUnselctItem(state,0),
        getUnselctItem(state,1),
        getUnselctItem(state,2),
        getUnselctItem(state,3),
      ],
      currentIndex: state.currentIndex,
      onTap: (int index) {
        state.currentIndex = index;
      },
    ),
  );
}

BottomNavigationBarItem getUnselctItem(HomeState state, int index) {
   if(state.currentIndex == index) {
     return BottomNavigationBarItem(
         icon: Image(
           image: AssetImage("img/icon_home_normal.png"),
           width: 22,
           height: 22,
         ),
         title: Text(
           'HOME',
           style: TextStyle(
               fontSize: 10,
               color: Color(0xff808080)),
         ));
   }else{
     return BottomNavigationBarItem(
         icon: Image(
           image: AssetImage("img/icon_home_normal.png"),
           width: 22,
           height: 22,
         ),
         title: Text(
           'HOME',
           style: TextStyle(
               fontSize: 10,
               color: Color(0xffF54D4C)),
         ));
   }
}
