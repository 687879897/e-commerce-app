import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/catogry-response.dart';


class CategoryItem extends StatelessWidget {
  final CatogryDM categoryDM;

  const CategoryItem(this.categoryDM, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      //  margin: EdgeInsets.all(1),
      child: Column(
        children: [
          Spacer(),
          CircleAvatar(
            radius: 30,
            backgroundImage: CachedNetworkImageProvider(
              categoryDM.image ?? "",
            ),
          ),
          Spacer(),
          Text(
            categoryDM.name ?? "",
            textAlign: TextAlign.center,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}