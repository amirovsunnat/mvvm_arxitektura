import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture_darsi/model/flavour_model.dart';
import 'package:mvvm_architecture_darsi/model/flavour_repo.dart';

class FlavourNotifier extends ChangeNotifier {
  final FlavourRepository flavourRepository;
  List<FlavourData> flavours = [];
  bool isLoading = false;

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
}
