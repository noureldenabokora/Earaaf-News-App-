import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constant/const.dart';
import 'package:news_app/cubit/news_app_cubit.dart';
import 'package:news_app/cubit/news_app_states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsAppCubit.get(context).business;
        return ConditionalBuilderRec(
          condition: list.length > 0,
          builder: (context) => ListView.separated(
            itemBuilder: (ctx, i) => articleWidget(list[i], context),
            separatorBuilder: (context, index) => Container(
              height: 1,
              color: Colors.grey,
            ),
            itemCount: list.length,
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
