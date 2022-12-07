import 'package:get/get.dart';

import '../modules/cart/views/cart_view.dart';
import '../modules/goodsList/bindings/goods_list_binding.dart';
import '../modules/goodsList/views/goods_list_view.dart';
import '../modules/pass/codeLoginStepOne/bindings/code_login_step_one_binding.dart';
import '../modules/pass/codeLoginStepOne/views/code_login_step_one_view.dart';
import '../modules/pass/codeLoginStepTwo/bindings/code_login_step_two_binding.dart';
import '../modules/pass/codeLoginStepTwo/views/code_login_step_two_view.dart';
import '../modules/pass/onStepLogin/bindings/on_step_login_binding.dart';
import '../modules/pass/onStepLogin/views/on_step_login_view.dart';
import '../modules/pass/passLogin/bindings/pass_login_binding.dart';
import '../modules/pass/passLogin/views/pass_login_view.dart';
import '../modules/pass/registerStepOne/bindings/register_step_one_binding.dart';
import '../modules/pass/registerStepOne/views/register_step_one_view.dart';
import '../modules/pass/registerStepThree/bindings/register_step_three_binding.dart';
import '../modules/pass/registerStepThree/views/register_step_three_view.dart';
import '../modules/pass/registerStepTwo/bindings/register_step_two_binding.dart';
import '../modules/pass/registerStepTwo/views/register_step_two_view.dart';
import '../modules/productcontent/bindings/productcontent_binding.dart';
import '../modules/productcontent/views/productcontent_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.GOODS_LIST,
      page: () => const GoodsListView(),
      binding: GoodsListBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.PRODUCTCONTENT,
      page: () => const ProductcontentView(),
      binding: ProductcontentBinding(),
    ),
    GetPage(
      name: _Paths.Cart,
      page: () => CartView(),
    ),
    GetPage(
      name: _Paths.CODE_LOGIN_STEP_ONE,
      page: () => const CodeLoginStepOneView(),
      binding: CodeLoginStepOneBinding(),
    ),
    GetPage(
      name: _Paths.CODE_LOGIN_STEP_TWO,
      page: () => const CodeLoginStepTwoView(),
      binding: CodeLoginStepTwoBinding(),
    ),
    GetPage(
      name: _Paths.ON_STEP_LOGIN,
      page: () => const OnStepLoginView(),
      binding: OnStepLoginBinding(),
    ),
    GetPage(
      name: _Paths.PASS_LOGIN,
      page: () => const PassLoginView(),
      binding: PassLoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP_ONE,
      page: () => const RegisterStepOneView(),
      binding: RegisterStepOneBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP_TWO,
      page: () => const RegisterStepTwoView(),
      binding: RegisterStepTwoBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP_THREE,
      page: () => const RegisterStepThreeView(),
      binding: RegisterStepThreeBinding(),
    ),
  ];
}
