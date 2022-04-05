import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constant/const.dart';
import 'package:news_app/cubit/news_app_cubit.dart';
import 'package:news_app/cubit/news_app_states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocConsumer<NewsAppCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsAppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                deafualtTextformField(
                  controller: searchController,
                  saved: (value) {},
                  onChange: (value) {
                    NewsAppCubit.get(context).getSearchData(value);
                    print('${value}');
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this must not be empty';
                    }
                    return null;
                  },
                  lable: 'Search',
                  icon: const Icon(Icons.search),
                ),
                const SizedBox(
                  height: 10,
                ),

                // articleWidget(list, context),
              ],
            ),
          ),
        );
      },
    );
  }
}
