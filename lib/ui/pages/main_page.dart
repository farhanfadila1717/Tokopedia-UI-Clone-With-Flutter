part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavbarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavbarIndex = 0;
    pageController = PageController(initialPage: bottomNavbarIndex);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              color: mainColor,
              axisDirection: AxisDirection.right,
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    bottomNavbarIndex = index;
                  });
                },
                children: [
                  HomePage(),
                  FeedPage(),
                  OfficialStorePage(),
                  KeranjangPage(),
                  AkunPage(),
                ],
              ),
            ),
          ),
          customBottomBar(),
        ],
      ),
    );
  }

  Widget customBottomBar() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: (bottomNavbarIndex == 3)
                    ? Colors.transparent
                    : Colors.black.withOpacity(0.05),
                spreadRadius: 5,
                blurRadius: 20,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: mainColor,
            unselectedItemColor: accentColor3,
            showUnselectedLabels: true,
            currentIndex: bottomNavbarIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                bottomNavbarIndex = index;
                pageController.jumpToPage(index);
              });
            },
            items: [
              BottomNavigationBarItem(
                title: Text(
                  "Home",
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                icon: Container(
                  height: 24,
                  margin: EdgeInsets.only(bottom: 2),
                  child: SvgPicture.asset((bottomNavbarIndex == 0)
                      ? "assets/icons/home_selected.svg"
                      : "assets/icons/home.svg"),
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  "Feed",
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                icon: Container(
                  height: 24,
                  margin: EdgeInsets.only(bottom: 2),
                  child: SvgPicture.asset((bottomNavbarIndex == 1)
                      ? "assets/icons/feed_selected.svg"
                      : "assets/icons/feed.svg"),
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  "Official Store",
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                icon: Container(
                  height: 24,
                  margin: EdgeInsets.only(bottom: 2),
                  child: SvgPicture.asset((bottomNavbarIndex == 2)
                      ? "assets/icons/official_selected.svg"
                      : "assets/icons/official.svg"),
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  "Keranjang",
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                icon: Container(
                  height: 24,
                  margin: EdgeInsets.only(bottom: 2),
                  child: SvgPicture.asset(
                    (bottomNavbarIndex == 3)
                        ? "assets/icons/keranjang_selected.svg"
                        : "assets/icons/keranjang.svg",
                  ),
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  "Akun",
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                icon: Container(
                  margin: EdgeInsets.only(bottom: 2),
                  height: 24,
                  child: SvgPicture.asset(
                    (bottomNavbarIndex == 4)
                        ? "assets/icons/akun_selected.svg"
                        : "assets/icons/akun.svg",
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
