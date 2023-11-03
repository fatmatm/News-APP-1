import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_test/Cubit/states.dart';
import 'package:news_app_test/Modules/science.dart';
import 'package:news_app_test/Modules/sport.dart';
import'package:http/http.dart'as http;
import '../Modules/business.dart';

class news_Cubit extends Cubit<news_States>{
  news_Cubit() : super(initial_State());
  static news_Cubit get(context)=>BlocProvider.of(context);

  int current_Index=0;
  List<dynamic> business_list=[];
  List<dynamic> sport_list=[];
  List<dynamic> science_list=[];

  List<BottomNavigationBarItem> bottem_Item=[
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
  ];
 void change_Bottom_bar( index){
   current_Index=index;

   if(index==1)
   getSport();
   if(index==2)
     getScience();
   emit(bottom_bar_change());
 }
 bool IsDark=false;
 void change_Mode(){

   IsDark=!IsDark;
   emit(icom_Change_mood());
 }
List<Widget> Screen=[
  Besiness_scrren(),
  Sport_scrren(),
  Science_screen(),

];

  void getBesiness() async{
    print('feachUser called');
    const url='https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=36d37203cdfa43d68a54eaea9a69feac';
    final uri=Uri.parse(url);
    final response =await http.get(uri);
    final body =response.body;
    final json=jsonDecode(body);

    business_list=json['articles'] ;
    print(business_list);
    emit(getBuisnesDataFromapi());
    print('fatch compleated');
  }
  void getSport() async{
    print('feachUser called');
    const url='https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=36d37203cdfa43d68a54eaea9a69feac';
    final uri=Uri.parse(url);
    final response =await http.get(uri);
    final body =response.body;
    final json=jsonDecode(body);
    sport_list=json['articles'] ;
    emit(getSportDataFromapi());
    print('fatch compleated');
  }
  void getScience() async{
    print('feachUser called');
    const url='https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=36d37203cdfa43d68a54eaea9a69feac';
    final uri=Uri.parse(url);
    final response =await http.get(uri);
    final body =response.body;
    final json=jsonDecode(body);
    science_list=json['articles'] ;
    emit(getSciencetDataFromapi());
    print('fatch compleated');
  }
}