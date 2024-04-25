import 'package:get/get.dart';
import 'package:knovator_task/view/form_fill_view/form_fill_controller.dart';

class FormFillBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<FormFillController>(FormFillController());
  }

}