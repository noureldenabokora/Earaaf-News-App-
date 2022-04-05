import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_app_states.dart';
import 'package:news_app/dio_helper/dio_helper.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/sport_screen.dart';

class NewsAppCubit extends Cubit<NewsStates> {
  NewsAppCubit() : super(NewAppIntialState());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavBarList = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  List<Widget> listOfScreens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  void ChangeNavBar(int index) {
    currentIndex = index;

    emit(NewAppChangeNavBarState());
  }

  List business = [];

  void getBusinessData() {
    emit(NewAppBusinessLoadingState());
    DioHellper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewAppBusinessSucssesState());
    }).catchError((error) {
      print(error.toString());
      emit(NewAppBusinessErrortate());
    });
  }

  List sport = [];

  void getSportData() {
    emit(NewAppSportLoadingState());
    DioHellper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sport',
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      sport = value.data['articles'];
      // print(business[0]['title']);
      emit(NewAppSportSucssesState());
    }).catchError((error) {
      print(error.toString());
      emit(NewAppSportErrortate());
    });
  }

  List science = [];

  void getScienceData() {
    emit(NewAppScienceLoadingState());
    DioHellper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      science = value.data['articles'];
      // print(business[0]['title']);
      emit(NewAppScienceSucssesState());
    }).catchError((error) {
      print(error.toString());
      emit(NewAppScienceErrortate());
    });
  }

  List search = [];

  void getSearchData(String? searchWord) {
    emit(NewAppSearchLoadingState());
    DioHellper.getData(
      url: 'v2/everything',
      query: {
        'q': '$searchWord',
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      search = value.data['articles'];
      // print(business[0]['title']);
      emit(NewAppSearchSucssesState());
    }).catchError((error) {
      print(error.toString());
      emit(NewAppSearchErrortate());
    });
  }

  bool isDark = false;

  void ChangeAppMode() {
    isDark = !isDark;
    emit(NewAppChangeAppModeState());
  }
}
