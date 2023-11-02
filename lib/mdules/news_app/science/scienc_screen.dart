
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/news_app/cubit/cubit.dart';
import '../../../layout/news_app/cubit/states.dart';
import '../../../shared/components/components.dart';


class Science_Screen extends StatelessWidget {
  const Science_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list=NewsCubit.get(context).science;
    return BlocConsumer<NewsCubit,NewsStates>(
        builder:(context,state) {
          return articalBludier(list);
        } ,
        listener:(context,state) {}
    );
  }
}
