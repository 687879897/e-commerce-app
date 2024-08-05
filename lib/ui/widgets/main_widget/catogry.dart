import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/catogry-response.dart';
import '../app-loader.dart';


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
            child: CachedNetworkImage(
              imageUrl: categoryDM.image??" ",
              placeholder: (_, __) => const AppLoader(),
              errorWidget: (_, __, ___) => const Icon(Icons.error),
              width: double.infinity,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * .16,
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