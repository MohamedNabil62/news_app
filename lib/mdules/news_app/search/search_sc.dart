import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/news_app/cubit/cubit.dart';
import '../../../layout/news_app/cubit/states.dart';
import '../../../shared/components/components.dart';

//import '../../shared/components/components.dart';
var text_con=TextEditingController();
class Search_Screen extends StatelessWidget {
  const Search_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        builder: (context, state) =>  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                    controller:text_con ,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("search must not be empty");
                      }
                      return null;
                    },
                    onChanged: (value){
                      NewsCubit.get(context).getsearch(value);
                    },
                    decoration: InputDecoration(prefixIcon: Icon(Icons.search),
                        labelText: "search",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))
                    )
                ),
              ),
              Expanded(child: articalBludier(NewsCubit.get(context).search,isSearch:true)),
            ],
          ),
        ),
        listener: (context, state) {},
    );
  }
}
