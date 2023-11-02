import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import '../../../mdules/news_app/business/business_screen.dart';
import '../../../mdules/news_app/science/scienc_screen.dart';
import '../../../mdules/news_app/sports/sportes_screen.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);
  int current_index=1;
  void changeindex(int index)
  {
  current_index=index;
  /*

  if(index==2)
    getSports();
  if(index==1)
    getScience();
    replace with
    ..getSports()..getScience()
    in screen news-layout
  */
  emit(NewsChangeBottomSheetState());
}
List Screen=[
  Business_Screen(),
  Science_Screen(),
  Sports_Screen(),
 // Setting_Screen(),
];
  List<dynamic> business=[];
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    Diohelper.get(
        url:"v2/top-headlines" ,
        query:{
          "country":"us",
          "category":"business",
          "apikey":"afb30b18851c458080a2ca1dfdc1bf8b",
        }
    ).then((value) {
      business=value.data["articles"];
      print(business[0]["description"].toString());
      emit(NewsGetBusinessSuccessState());
    }).
    catchError((onError){
      print("i like this");
      print(onError.toString());
      emit(NewsGetBusinessErrorState(onError.toString()));
    });
  }

  List<dynamic> sports=[];
  void getSports(){
    emit(NewsGetSportLoadingState());
    if(sports.length==0)
      {
        Diohelper.get(
            url:"v2/top-headlines" ,
            query:{
              "country":"us",
              "category":"sports",
              "apikey":"afb30b18851c458080a2ca1dfdc1bf8b",
            }
        ).then((value) {
          sports=value.data["articles"];
          print(sports[0]["description"].toString());
          emit(NewsGetSportsSuccessState());
        }).
        catchError((onError){
          print(onError.toString());
          emit(NewsGetSportsErrorState(onError.toString()));
        });
      }else
        {
          emit(NewsGetSportsSuccessState());
        }

  }

  List<dynamic> science=[];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    if(science.length==0)
      {
        Diohelper.get(
            url:"v2/top-headlines" ,
            query:{
              "country":"us",
              "category":"science",
              "apikey":"afb30b18851c458080a2ca1dfdc1bf8b",
            }
        ).then((value) {
          science=value.data["articles"];
          print(science[0]["description"].toString());
          emit(NewsGetScienceSuccessState());
        }).
        catchError((onError){
          print(onError.toString());
          emit(NewsGetScienceErrorState(onError.toString()));
        });
      }
    else
      {
        emit(NewsGetScienceSuccessState());
      }

  }
  List<dynamic> search=[];
  void getsearch(String value){
    emit(NewsGetSearchLoadingState());
    Diohelper.get(
        url:"v2/everything" ,
        query:{
          "q":"${value}",
          "apikey":"afb30b18851c458080a2ca1dfdc1bf8b",
        }
    ).then((value) {
      search=value.data["articles"];
      emit(NewsGetSearchSuccessState());
    }).
    catchError((onError){
      print(onError.toString());
      emit(NewsGetSearchErrorState(onError.toString()));
    });

  }
  bool mode=true;
  void changemode({bool? shardform})
  {
    if(shardform!=null)
      {
        mode=shardform;
        emit(NewsGangeModeState());
      }
    else {
      mode = !mode;
      CacheHelper.putData(kay: "mode", value: mode).then((value) {
        emit(NewsGangeModeState());
      });
    }
  }
}