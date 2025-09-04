import 'package:breach/features/home/domain/controllers/guest_controller.dart';
import 'package:get/get.dart';

class GuestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuestController>(() => GuestController());
  }
}
