// app_routes.dart
part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = '/';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const REGISTER = '/register'; // tambahkan ini
  static const PROFIL = _Paths.PROFIL;
  static const JADWALPILKETOS = _Paths.JADWALPILKETOS;
  static const PILKETOS = _Paths.PILKETOS;
  static const KANDIDAT1 = _Paths.KANDIDAT1;
  static const QUICKCOUNT = _Paths.QUICKCOUNT;
  static const KANDIDAT2 = _Paths.KANDIDAT2;
  static const KANDIDAT3 = _Paths.KANDIDAT3;
  static const TANYAJAWAB = _Paths.TANYAJAWAB;
  static const JAWABAN_KANDIDAT = _Paths.JAWABAN_KANDIDAT;
  static const PENGATURAN = _Paths.PENGATURAN;
}

abstract class _Paths {
  static const SPLASH = '/';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const REGISTER = '/register'; // tambahkan ini juga
  static const PROFIL = '/profil';
  static const JADWALPILKETOS = '/jadwalpilketos';
  static const PILKETOS = '/pilketos';
  static const KANDIDAT1 = '/kandidat1';
  static const QUICKCOUNT = '/quickcount';
  static const KANDIDAT2 = '/kandidat2';
  static const KANDIDAT3 = '/kandidat3';
  static const TANYAJAWAB = '/tanyajawab';
  static const JAWABAN_KANDIDAT = '/jawaban-kandidat';
  static const PENGATURAN = '/pengaturan';
}
