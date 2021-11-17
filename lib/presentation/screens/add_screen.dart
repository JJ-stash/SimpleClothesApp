import 'package:flutter/material.dart';
import 'package:midterm_app/data/models/clothes_models.dart';
import 'package:midterm_app/data/repository/clothes_repo.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  static const routeName = "/add-screen";

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController clotheID = TextEditingController();
  TextEditingController clotheName = TextEditingController();
  TextEditingController clotheUrl = TextEditingController();
  TextEditingController clotheSize = TextEditingController();
  TextEditingController clothePrice = TextEditingController();
  TextEditingController clotheDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add"),
          centerTitle: true,
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 20),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: clotheID,
                    decoration:
                        const InputDecoration(hintText: 'Please enter ID'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Value!";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: clotheName,
                    decoration:
                        const InputDecoration(hintText: 'Please enter Name'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Value!";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: clotheUrl,
                    decoration:
                        const InputDecoration(hintText: 'Please enter Image'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Value!";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: clotheSize,
                    decoration:
                        const InputDecoration(hintText: 'Please enter Size'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Value!";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: clothePrice,
                    decoration:
                        const InputDecoration(hintText: 'Please enter Price'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Value!";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: clotheDesc,
                    decoration: const InputDecoration(
                        hintText: 'Please enter Description'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Value!";
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Back")),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Clothes clothes = Clothes(
                                id: int.parse(clotheID.text),
                                name: clotheName.text,
                                imageUrl: clotheUrl.text,
                                size: clotheSize.text,
                                price: double.parse(clothePrice.text),
                                description: clotheDesc.text,
                              );
                              ClothesRepo().addClothes(clothes);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Add"))
                    ],
                  )
                ],
              )),
        ));
  }
}
