import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(),
            SizedBox(height: 50),
            Expanded(child: SearchResultListView()),
          ],
        ),
      ),
    );
  }
}
