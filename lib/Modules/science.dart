import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_test/Cubit/cubit.dart';
import 'package:news_app_test/Cubit/states.dart';
import 'package:news_app_test/webView.dart';


class Science_screen extends StatelessWidget {
  const Science_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<news_Cubit,news_States>(
      listener: (context ,state){},
      builder: (context,state){
        return ConditionalBuilder(
          condition: state is !ScienceGetloading ,
          builder:(context)=>ListView.builder(itemCount: news_Cubit.get(context).science_list.length,
            itemBuilder: (context,index){
              final science_list=news_Cubit.get(context).science_list[index];
              final image=science_list['urlToImage'];
              final paragrph=science_list['title'];
              final date=science_list['publishedAt'];

              return
                InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder:(Context)=> web_View(science_list['url'])));
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(image),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          height: 110,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(paragrph,maxLines:4),
                              SizedBox(height: 10,),
                              Text(date,style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
            },
          ) ,
          fallback: (context)=>Text('faild'),

        );
      },
    );
  }
}
