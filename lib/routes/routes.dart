import 'package:get/get.dart';
import 'package:knovator_task/routes/routes_name.dart';
import 'package:knovator_task/view/form_fill_view/form_fill_binding.dart';

import '../view/form_fill_view/form_fill_view.dart';


/// Function to define a GetPage route
GetPage getPage(
    {String? name,
    GetPageBuilder? page,
    Bindings? binding,
    List<GetPage<dynamic>>? children}) {
  return GetPage(
    name: name!,
    page: page!,
    binding: binding,
    children: children ?? [],
  );
}

/// List of all routes
List<GetPage> pages = [
  getPage(
      name: RoutesName.formFillView,
      page: () => const FormFillView(),
      binding: FormFillBinding()),
];
