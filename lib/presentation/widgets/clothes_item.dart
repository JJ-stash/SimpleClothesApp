import 'package:flutter/material.dart';

class ClothesItem extends StatelessWidget {
  const ClothesItem(
      {Key? key,
      required this.name,
      required this.price,
      required this.imageUrl})
      : super(key: key);

  final String imageUrl;
  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: FadeInImage(
              placeholder:
                  const AssetImage('./assets/images/clothes_placeholder.png'),
              image: NetworkImage(imageUrl),
              width: 100,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          Align(alignment: Alignment.centerLeft, child: Text(name)),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(price.toString()),
          )
        ],
      ),
    );
  }
}
