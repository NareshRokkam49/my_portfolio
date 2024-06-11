
import 'package:get/get.dart';
import 'package:myportfolio/view/about_me_screen.dart';
import 'package:myportfolio/view/desh_board_screen.dart';
import 'package:myportfolio/view/education_screen.dart';
import 'package:myportfolio/view/expriance_screen.dart';
import 'package:myportfolio/view/projects/project_info/momb_info_screen.dart';
import 'package:myportfolio/view/projects/project_info/pro_info_screen.dart';
import 'package:myportfolio/view/skills_screen.dart';
import 'package:myportfolio/view/spash_screen.dart';

import '../view/profile_screen.dart';
import '../view/projects/project_info/el_project_profile_screen.dart';
import '../view/projects/project_info/phr_info_screen.dart';
import '../view/projects/projects_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [

GetPage(name: AppRoutes.splashScreen, page: () => SplashScreen()),
GetPage(name: AppRoutes.dashBoardScreen, page: () => DashBoardScreen()),
GetPage(name: AppRoutes.aboutMeScreen, page: () => AboutMeScreen()),
GetPage(name: AppRoutes.exprienceScreen, page: () => ExprienceScreen()),
GetPage(name: AppRoutes.educationScreen, page: () => EducationScreen()),
GetPage(name: AppRoutes.skillsScreen, page: () => SkillsScreen()),
GetPage(name: AppRoutes.projectsScreen, page: () => ProjectsScreen()),
GetPage(name: AppRoutes.elProjectProfileScreen, page: () => ElProjectProfileScreen()),
GetPage(name: AppRoutes.mombProjectScreen, page: () => MombProjectScreen()),
GetPage(name: AppRoutes.proProjectScreen, page: () => ProProjectScreen()),
GetPage(name: AppRoutes.phrProjectScreen, page: () => PhrProjectScreen()),
GetPage(name: AppRoutes.profileScreen, page: () => ProfileScreen()),

  ];
}
