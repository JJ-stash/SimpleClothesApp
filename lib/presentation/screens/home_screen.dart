import 'package:flutter/material.dart';
import 'package:midterm_app/data/dummy_data.dart';
import 'package:midterm_app/data/models/clothes_models.dart';
import 'package:midterm_app/presentation/screens/add_screen.dart';
import 'package:midterm_app/presentation/screens/screens.dart';
import 'package:midterm_app/presentation/widgets/clothes_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Clothes> clothesList = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Title"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: clothesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            final clothe = clothesList[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, DetailsScreen.routeName,
                      arguments: clothe)
                  .then((_) {
                setState(() {});
              }),
              onLongPress: () => Navigator.pushNamed(
                  context, EditScreen.routeName,
                  arguments: {"clothe": clothe, "index": index}).then((_) {
                setState(() {});
              }),
              child: ClothesItem(
                name: clothesList[index].name,
                price: clothesList[index].price,
                imageUrl: clothesList[index].imageUrl,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () =>
              Navigator.pushNamed(context, AddScreen.routeName).then((_) {
                setState(() {});
              })),
    );
  }
}
