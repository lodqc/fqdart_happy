import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class HomeState implements Cloneable<HomeState>{
  int currentIndex = 0;
  @override
  HomeState clone() {
    return HomeState();
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}
