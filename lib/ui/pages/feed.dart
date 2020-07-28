part of 'pages.dart';

class FeedPage extends StatefulWidget {
  FeedPage({
    Key key,
    this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> with TickerProviderStateMixin {
  AnimationController offsetAnimationController;
  Animation<Offset> offsetAnimation;

  Brightness brightnessCutom = Brightness.light;
  double opacityBackground = 1.0;
  bool secondAppbar = false;
  GlobalKey key = GlobalKey();

  ScrollController scrollControlllerSingle;

  @override
  void initState() {
    scrollControlllerSingle = ScrollController()
      ..addListener(() {
        print("offset = ${scrollControlllerSingle.offset}");
      });

    super.initState();
  }

  // NOTE: Scrooll Show Content
  bool scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      if (scrollInfo.metrics.pixels > 85) {
        setState(() {
          opacityBackground = 0;
          brightnessCutom = Brightness.dark;
          secondAppbar = true;
        });
      } else {
        setState(() {
          opacityBackground = 1;
          brightnessCutom = Brightness.light;
          secondAppbar = false;
        });
      }
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double widthSizeMargin = widthSize - 2 * defaultMargin;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: brightnessCutom,
      ),
      child: Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: scrollListener,
          child: Stack(
            children: [
              createBackgoundAnimation(widthSize),
              Align(
                alignment: Alignment.topCenter,
                child: ScrollConfiguration(
                  behavior: ScrollBehavior(),
                  child: GlowingOverscrollIndicator(
                    color: accentColor3,
                    axisDirection: AxisDirection.down,
                    child: SingleChildScrollView(
                      controller: scrollControlllerSingle,
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width: widthSize,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: defaultMargin,
                                        right: defaultMargin,
                                        top: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Feed",
                                          style: whiteTextFont.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.search,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Icon(
                                          Icons.mail,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Icon(
                                          Icons.notifications,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Updates",
                                              style: whiteTextFont.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Spacer(),
                                            Container(
                                              height: 4,
                                              width: double.infinity,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Explore",
                                              style: whiteTextFont.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Spacer(),
                                            Container(
                                              height: 4,
                                              width: double.infinity,
                                              color: Colors.transparent,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: widthSizeMargin,
                            margin: EdgeInsets.symmetric(
                                horizontal: defaultMargin, vertical: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: accentColor3.withOpacity(0.5),
                                  blurRadius: 5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.lightGreen,
                                        ),
                                        child: Icon(
                                          Icons.shopping_basket,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Container(
                                        key: key,
                                        height: 40,
                                        width: widthSizeMargin - 66,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "toko palu gada".toLowerCase(),
                                              style: blackTextFont.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "10 menit yang lalu",
                                              style: greyTextFont.copyWith(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 6),
                                  child: Text(
                                    "Khusus untukmu, klik gambar produk untuk beli sebelum kehabisan!",
                                    style: greyTextFont.copyWith(
                                        fontSize: 12, height: 1.5),
                                    softWrap: true,
                                    maxLines: 4,
                                  ),
                                ),
                                Container(
                                  height: 300,
                                  width: double.infinity,
                                  child: GridView.count(
                                    primary: false,
                                    padding: EdgeInsets.all(0),
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  dummyProduk[0].fotoProduk),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  dummyProduk[1].fotoProduk),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  dummyProduk[2].fotoProduk),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                dummyProduk[3].fotoProduk),
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.4),
                                                BlendMode.darken),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "+3 Lihat Lainya",
                                            style: whiteTextFont.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: widthSizeMargin,
                            margin: EdgeInsets.symmetric(
                                horizontal: defaultMargin, vertical: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: accentColor3.withOpacity(0.5),
                                  blurRadius: 5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.lightGreen,
                                        ),
                                        child: Icon(
                                          Icons.shopping_basket,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Container(
                                        height: 40,
                                        width: widthSizeMargin - 66,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "toko palu gada".toLowerCase(),
                                              style: blackTextFont.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "10 menit yang lalu",
                                              style: greyTextFont.copyWith(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 6),
                                  child: Text(
                                    "Khusus untukmu, klik gambar produk untuk beli sebelum kehabisan!",
                                    style: greyTextFont.copyWith(
                                        fontSize: 12, height: 1.5),
                                    softWrap: true,
                                    maxLines: 4,
                                  ),
                                ),
                                Container(
                                  height: 300,
                                  width: double.infinity,
                                  child: GridView.count(
                                    primary: false,
                                    padding: EdgeInsets.all(0),
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  dummyProduk[0].fotoProduk),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  dummyProduk[1].fotoProduk),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  dummyProduk[2].fotoProduk),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                dummyProduk[3].fotoProduk),
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.4),
                                                BlendMode.darken),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "+3 Lihat Lainya",
                                            style: whiteTextFont.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              (secondAppbar == true)
                  ? secondAppbarWidget(widthSize)
                  : SizedBox(),
              Positioned(
                bottom: 80,
                right: defaultMargin,
                child: FloatingActionButton(
                  onPressed: () {},
                  elevation: 0,
                  backgroundColor: mainColor,
                  splashColor: accentColor3.withOpacity(0.5),
                  highlightElevation: 0,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 38,
                          width: 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      Center(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Container(
                            height: 38,
                            width: 6,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

// NOTE: SecondAppBar
  Widget secondAppbarWidget(double widthSize) => Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 65,
          width: widthSize,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 28,
                width: widthSize,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            "Updates",
                            style: greenTextFont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Spacer(),
                          Container(
                            height: 4,
                            width: double.infinity,
                            color: mainColor,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            "Explore",
                            style: greyTextFont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Spacer(),
                          Container(
                            height: 4,
                            width: double.infinity,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
// NOTE: Background
  Widget createBackgoundAnimation(double widthSize) => Align(
        alignment: Alignment.topCenter,
        child: AnimatedOpacity(
          opacity: opacityBackground,
          duration: Duration(milliseconds: 200),
          child: ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              height: 200,
              width: widthSize,
              decoration: BoxDecoration(
                color: accentColor1,
              ),
            ),
          ),
        ),
      );
}

// NOTE: backgound clipper
class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 30);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
