import 'package:get/get.dart';

import '../controllers/productcontent_controller.dart';

class ProductcontentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductcontentController>(
      () => ProductcontentController(),
    );
  }
}
