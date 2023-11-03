import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_test/Cubit/cubit.dart';
import 'package:news_app_test/Cubit/states.dart';
class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=news_Cubit.get(context);
    return BlocProvider(

      create: (BuildContext context)=>news_Cubit()..getBesiness(),

      child: BlocConsumer<news_Cubit,news_States>(
        listener: (context,state){},
        builder: (context,state){
          return  Scaffold(
              appBar: AppBar(
                title: Text('News App',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color:news_Cubit.get(context).IsDark?Colors.white:Colors.black,
                  ),
                ),
                actions: [
                  IconButton(onPressed: (){
                    cubit.change_Mode();

                  }, icon: Icon(Icons.shield_moon),color: Colors.black,),
                ],
              ),
          body: news_Cubit.get(context).Screen[news_Cubit.get(context).current_Index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: news_Cubit.get(context).current_Index,
          items:
            news_Cubit.get(context).bottem_Item,

         onTap: (index){
            news_Cubit.get(context).change_Bottom_bar(index);
          },
          ),

          );
        },

      ),
    );
  }
}
