import 'package:flutter/material.dart';
import 'package:shopping/app/models/category-list-item.model.dart';
import 'package:shopping/app/ui/shared/components/loader/loader_widget.dart';

import 'category_card/category_card_widget.dart';

class CategoryListWidget extends StatelessWidget {
  final List<CategoryListItemModel> categories;

  CategoryListWidget({@required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: LoaderWidget(
        object: categories,
        callback: list,
      ),
    );
  }

  Widget list(){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index){
        var item = categories[index];

        return Padding(
          padding: EdgeInsets.all(5),
          child: CategoryCardWidget(
            item: item,
          ),
        );
      },
    );
  }
}
