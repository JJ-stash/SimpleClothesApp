import 'package:midterm_app/data/models/clothes_models.dart';
import 'package:midterm_app/data/dummy_data.dart';

class ClothesRepo {
  void addClothes(Clothes clothes) {
    DUMMY_DATA.add(clothes);
  }

  void removeClothes(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }

  void editClothes(Clothes clothes, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [clothes]);
  }
}
