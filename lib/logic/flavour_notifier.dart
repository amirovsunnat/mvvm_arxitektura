import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture_darsi/model/flavour_model.dart';
import 'package:mvvm_architecture_darsi/model/flavour_repo.dart';

class FlavourNotifier extends ChangeNotifier {
  final FlavourRepository flavourRepository;
  List<FlavourData> flavours = [];
  bool isLoading = false;
  String message = "";

  FlavourNotifier({required this.flavourRepository});

  Future<void> getAllFlavours() async {
    flavours.clear();
    isLoading = true;
    notifyListeners();
    final response = await flavourRepository.getFlavours();
    final FlavourModel flavour = FlavourModel.fromJson(response);
    flavours.addAll(flavour.data ?? []);
    isLoading = false;
    notifyListeners();
  }

  Future<void> deleteFlavour(String id) async {
    isLoading = true;
    notifyListeners();
    final response = await flavourRepository.deletePost(id);
    if (response) {
      message = "Product deleted successfully";
    } else {
      message = "Error happened while deleting product";
    }
    isLoading = false;
    notifyListeners();
    await getAllFlavours();
  }
}
