import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwalpilketos/bindings/jadwalpilketos_binding.dart';
import '../modules/jadwalpilketos/views/jadwalpilketos_view.dart';
import '../modules/kandidat1/bindings/kandidat1_binding.dart';
import '../modules/kandidat1/views/kandidat1_view.dart';
import '../modules/kandidat2/bindings/kandidat2_binding.dart';
import '../modules/kandidat2/views/kandidat2_view.dart';
import '../modules/kandidat3/bindings/kandidat3_binding.dart';
import '../modules/kandidat3/views/kandidat3_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pengaturan/bindings/pengaturan_binding.dart';
import '../modules/pengaturan/views/pengaturan_view.dart';
import '../modules/pilketos/bindings/pilketos_binding.dart';
import '../modules/pilketos/views/pilketos_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/quickcount/bindings/quickcount_binding.dart';
import '../modules/quickcount/views/quickcount_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/tanyajawab/bindings/tanyajawab_binding.dart';
import '../modules/tanyajawab/views/tanyajawab_view.dart';

import '../widgets/splash.dart'; // Tambahkan splash screen

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => const ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.JADWALPILKETOS,
      page: () => const JadwalpilketosView(),
      binding: JadwalpilketosBinding(),
    ),
    GetPage(
      name: _Paths.PILKETOS,
      page: () => const PilketosView(),
      binding: PilketosBinding(),
    ),
    GetPage(
      name: _Paths.KANDIDAT1,
      page: () => const Kandidat1View(),
      binding: Kandidat1Binding(),
    ),
    GetPage(
      name: _Paths.QUICKCOUNT,
      page: () => const QuickcountView(),
      binding: QuickcountBinding(),
    ),
    GetPage(
      name: _Paths.KANDIDAT2,
      page: () => const Kandidat2View(),
      binding: Kandidat2Binding(),
    ),
    GetPage(
      name: _Paths.KANDIDAT3,
      page: () => const Kandidat3View(),
      binding: Kandidat3Binding(),
    ),
    GetPage(
      name: _Paths.TANYAJAWAB,
      page: () => const TanyajawabView(),
      binding: TanyajawabBinding(),
    ),
    GetPage(
      name: _Paths.PENGATURAN,
      page: () => const PengaturanView(),
      binding: PengaturanBinding(),
    ),
  ];
}
