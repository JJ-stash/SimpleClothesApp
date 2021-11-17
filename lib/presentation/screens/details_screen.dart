import 'package:flutter/material.dart';
import 'package:midterm_app/data/models/clothes_models.dart';
import 'package:midterm_app/data/repository/clothes_repo.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key}) : super(key: key);

  static const routeName = "/details-screen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Clothes clothe =
        ModalRoute.of(context)!.settings.arguments as Clothes;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: const Text("Are You Sure??"),
                          content:
                              const Text("Are You Sure To Delete This Item ??"),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("No")),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    ClothesRepo().removeClothes(clothe.id);
                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text("Yes"))
                          ],
                        ));
              },
              icon: const Icon(Icons.delete_outline))
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInImage(
              placeholder:
                  const AssetImage('./assets/images/clothes_placeholder.png'),
              image: NetworkImage(clothe.imageUrl),
              height: 300,
              width: 200,
              fit: BoxFit.contain,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Name:"), Text(clothe.name)]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text("Price:"),
              Text(clothe.price.toString())
            ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Size:"), Text(clothe.size)]),
            Text(clothe.description)
          ],
        ),
      ),
    );
  }
}
