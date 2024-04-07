import 'package:flutter/material.dart';
import 'widgets/custom_search_text_field.dart';
import 'widgets/search_result_list_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => Future.delayed(
            const Duration(seconds: 3),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomSearchTextField(),
                SizedBox(height: 16),
                Expanded(
                  child: SearchResultListView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
