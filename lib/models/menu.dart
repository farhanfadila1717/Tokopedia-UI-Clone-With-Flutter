part of 'models.dart';

class Menu {
  final String title;
  final String icon;

  Menu({this.title, this.icon});
}

List<Menu> menuList = [
  Menu(
    title: "Lihat Semua",
    icon: "assets/img/lihat_semua.png",
  ),
  Menu(
    title: "Kategori",
    icon: "assets/img/kategori.png",
  ),
  Menu(
    title: "Top Up",
    icon: "assets/img/top_up.png",
  ),
  Menu(
    title: "Keuangan",
    icon: "assets/img/keuangan.png",
  ),
  Menu(
    title: "Travel",
    icon: "assets/img/travel.png",
  ),
  Menu(
    title: "Semua Promo",
    icon: "assets/img/semua_promo.png",
  ),
];
