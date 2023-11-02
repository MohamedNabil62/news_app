// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';//import 'package:untitled/modules/web_view/webview_sc.dart';
import '../../layout/news_app/cubit/cubit.dart';
import '../../mdules/news_app/web_view/webview_sc.dart';
import '../network/local/cache_helper.dart';
import '../styles/IconBroken.dart';
import '../styles/colors.dart';
import 'constants.dart';
Widget defaultbutton({
  double width = double.infinity,
  Color colo=Colors.red,
  required VoidCallback function,
  @required String text="login",

} ) =>
    Container(
width:width,
decoration:BoxDecoration(
borderRadius:BorderRadius.circular(0),
color:colo
),
child: MaterialButton(
  onPressed:function,child:
Text(text.toUpperCase(),
style:TextStyle(color:Colors.white,
fontWeight:FontWeight.bold),),
),
);
Widget bulidArticalItem(artical,context) =>  InkWell(
  onTap: (){
    nevgitto(context,webview_screen(artical['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20),

    child: Row(

      children: [

        Container(

          height: 120,

          width: 120,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),

              image: DecorationImage(

                  image: NetworkImage("${artical["urlToImage"]}"),

                  fit: BoxFit.cover

              )

          ),



        ),

        SizedBox(width: 20,),

        Expanded(

          child: Container(

            height: 120,

            child: Column(



              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,



              children: [

                Expanded(

                  child: Text("${artical["title"]}",

                    style: TextStyle(

                        fontWeight: FontWeight.w600,

                        fontSize: 18,

                    ),

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text("${artical["publishedAt"]}",

                  style: TextStyle(

                      color:NewsCubit.get(context).mode?Colors.grey:Colors.white

                  ),



                )



              ],

            ),

          ),

        )

      ],

    ),

  ),
);

Widget articalBludier(List News,{isSearch=false}) => ConditionalBuilder(
  condition:News.length>0,
  builder:(context) =>ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder:(context,index) => bulidArticalItem(News[index],context),
    separatorBuilder:(context,index) =>Container(
      height: 1,
      color: Colors.grey[300],
    ) ,
    itemCount: 20,
  ),
  fallback:(context) => isSearch?Container():Center(child: CircularProgressIndicator()),
);

void nevgitto(context,Widget) => Navigator.push(context,
    MaterialPageRoute(builder: (context) => Widget
    )
);

void navigtorAndFinish(context,Widget) => Navigator.pushReplacement(context,
  MaterialPageRoute(builder: (context) => Widget,),
    result: (Route<dynamic> route ) => false,

);


Widget meSlider( ) => Padding(
  padding: const EdgeInsets.all(15.0),
  child:   Container(
    color: Colors.grey,
    height: 1,
  ),
);

PreferredSizeWidget  defaultAppBar({
  required BuildContext context,
  String? text,
  List<Widget>?action,
}) => AppBar(
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon: Icon(
      IconBroken.Arrow___Left_2
    ),
  ),
  titleSpacing: 5,
  title:Text(text!),
  actions:action,
);