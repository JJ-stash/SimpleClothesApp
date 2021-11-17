import 'package:flutter/material.dart';
import 'package:midterm_app/data/models/clothes_models.dart';
import 'package:midterm_app/data/repository/clothes_repo.dart';

class EditScreen extends StatefulWidget {
  static const routeName = "/edit-screen";

  const EditScreen({Key? key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController clotheID = TextEditingController();
  late TextEditingController clotheName = TextEditingController();
  late TextEditingController clotheUrl = TextEditingController();
  late TextEditingController clotheSize = TextEditingController();
  late TextEditingController clothePrice = TextEditingController();
  late TextEditingController clotheDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context)!.settings.arguments as Map;
    final Clothes clothes = parsedData["clothe"];
    final int index = parsedData["index"];
    clotheID = TextEditingController(text: clothes.id.toString());
    clotheName = TextEditingController(text: clothes.name);
    clotheUrl = TextEditingController(text: clothes.imageUrl);
    clotheSize = TextEditingController(text: clothes.size);
    clothePrice = TextEditingController(text: clothes.price.toString());
    clotheDesc = TextEditingController(text: clothes.description);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
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
                  decoration: const InputDecoration(
                    hintText: 'Please enter ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Value!";
                    }
                    return null;
                  },
                ),
                const Spacer(),
                TextFormField(
                  controller: clotheName,
                  decoration: const InputDecoration(
                    hintText: 'Please enter Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Value!";
                    }
                    return null;
                  },
                ),
                const Spacer(),
                TextFormField(
                  controller: clotheUrl,
                  decoration: const InputDecoration(
                    hintText: 'Please enter Image',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Value!";
                    }
                    return null;
                  },
                ),
                const Spacer(),
                TextFormField(
                  controller: clotheSize,
                  decoration: const InputDecoration(
                    hintText: 'Please enter Size',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Value!";
                    }
                    return null;
                  },
                ),
                const Spacer(),
                TextFormField(
                  controller: clothePrice,
                  decoration: const InputDecoration(
                    hintText: 'Please enter Price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Value!";
                    }
                    return null;
                  },
                ),
                const Spacer(),
                TextFormField(
                  controller: clotheDesc,
                  decoration: const InputDecoration(
                    hintText: 'Please enter Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
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
                            ClothesRepo().editClothes(clothes, index);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Edit"))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
