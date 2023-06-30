import 'package:get/get.dart';
import 'package:mytodo/screen/report/index.dart';

import 'package:mytodo/screen/dashboard/index.dart';
import 'package:mytodo/screen/home/index.dart';
import 'index.dart';

class PageRoutes {
  static const inital = PageName.initial;
  static final List<GetPage> routes = [
    GetPage(
      name: PageName.initial,
      page: () => const DashBoard(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: PageName.homepage,
      page: () => HomePage(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: PageName.report,
      page: () => const ReportPage(),
      binding: ReportBinding(),
    ),
  ];
}
