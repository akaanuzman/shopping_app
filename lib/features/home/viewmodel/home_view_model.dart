import 'dart:async';

import '../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/extensions/app_extensions.dart';
import '../model/home_model.dart';
import '../service/IProductService.dart';
import '../service/product_service.dart';

class HomeViewModel extends BaseViewModel {
  late IProductService productService;
  List<HomeModel> items = [];
  List<HomeModel> basketItems = [];
  double totalPrice = 0;
  bool isLoading = true;

  // Initialize Method
  @override
  void init() {
    Timer(context.durationNormal, loadPage);
    productService = ProductService(networkManager.dio);
  }

  // Api connection
  Future<void> fetchItems() async {
    items = await productService.fetchAllProducts();
    setState();
  }

  // Product count increment
  void incrementCount(HomeModel model) {
    model.isOpen = true;
    model.count++;
    totalMoney(model);
    if (!basketItems.contains(model)) {
      basketItems.add(model);
    }
    setState();
  }

  // Product count deincrement
  void deIncrementCount(HomeModel model) {
    if (model.count != 0) {
      model.count--;
      totalMoney(model);
      if (model.count > 1) {
        basketItems.remove(model);
      }
      setState();
    }
    model.count == 0 ? model.isOpen = false : null;
  }

  // Calculate total money
  void totalMoney(HomeModel model) {
    if (model.price != null) {
      totalPrice = items.fold(
          0,
          (previousValue, element) =>
              previousValue + element.price! * element.count);
      model.productPrice = model.price! * model.count;
      setState();
    }
  }

  // Method that makes data come animatically
  void loadPage() {
    isLoading = false;
    setState();
  }
}
