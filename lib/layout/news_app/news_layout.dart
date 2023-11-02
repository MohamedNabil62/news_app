import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../mdules/news_app/search/search_sc.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
class News_home extends StatelessWidget {
  const News_home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
          listener:(context, state) => {},
          builder: (context, state) {
            var cubit =NewsCubit.get(context);
           return   Scaffold(
              appBar: AppBar(
                title: Text(
                  "News App",
                   style: TextStyle(
                     fontSize: 25,
                     color: NewsCubit.get(context).mode?Colors.black:Colors.white
                   ),
                ),

                actions: [
                  IconButton(onPressed: (){

                    nevgitto(context,Search_Screen());
                  },
                      icon:Icon(Icons.search,
                          color: NewsCubit.get(context).mode?Colors.black:Colors.white
                      )
                  ),
                  SizedBox(width: 5,),
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: IconButton(onPressed: (){
                      NewsCubit.get(context).changemode();
                      print(NewsCubit.get(context).mode);
                    },
                        icon:Icon(Icons.brightness_4_outlined,
                            color: NewsCubit.get(context).mode?Colors.black:Colors.white
                        )
                    ),
                  )
                ],
              ),
              body:cubit.Screen[cubit.current_index],
              bottomNavigationBar:BottomNavigationBar(
                currentIndex: cubit.current_index,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                onTap: (index){
                  cubit.changeindex(index);
                },
                items:const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.business),
                      label: "Business",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.science,

                      ),
                      label: "Science"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.sports),
                      label: "Sports"
                  ),
                 /* BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: "Ssttings"
                  ),*/
                ],
              )
          ) ;
  }
        );

  }
}
