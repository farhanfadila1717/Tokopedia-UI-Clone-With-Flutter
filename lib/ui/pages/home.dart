part of 'pages.dart';

final List<String> imgList = [
  'https://ecs7.tokopedia.net/img/blog/promo/2020/06/Thumbnail3.jpg',
  'https://media.21cineplex.com/webcontent/gallery/pictures/157767538487410_925x527.jpg',
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController colorAnimationController;
  Animation appBarColorTween, iconColorTween, fieldColorTween;

  Brightness brightnessCutom = Brightness.light;
  ScrollController scrollControlllerSingle;

  Timer _timer;

  GlobalKey key = GlobalKey();
  int minutCountdown = 300;
  int secondCountdown = 59;
  int current = 0;
  int minuteShow = 4;
  bool secondAppBar = false;
  int selectedkategori = 0;
  double containerHeight = 80;

  void countDownTimer() {
    const oneSecond = const Duration(seconds: 1);

    _timer = Timer.periodic(
      oneSecond,
      (Timer timer) => setState(() {
        if (minutCountdown >= 1 || minuteShow > 0) {
          if (secondCountdown < 1) {
            secondCountdown += 59;
          } else {
            secondCountdown = secondCountdown - 1;
            if (secondCountdown == 0) {
              minutCountdown -= 60;
              if (minuteShow > 0) {
                minuteShow -= 1;
              } else {
                minuteShow = 0;
              }
            }
          }
        }
      }),
    );

    super.initState();
  }

  _fetchPrefs() async {
    await Future.delayed(Duration(seconds: 0));
    countDownTimer();
  }

  @override
  void initState() {
    colorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    appBarColorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(colorAnimationController);
    fieldColorTween =
        ColorTween(begin: Colors.white, end: accentColor3.withOpacity(0.2))
            .animate(colorAnimationController);
    iconColorTween = ColorTween(begin: Colors.white, end: accentColor3)
        .animate(colorAnimationController);
    scrollControlllerSingle = ScrollController()
      ..addListener(() {
        // print("offset = ${scrollControlllerSingle.offset}");
      });

    super.initState();
    _fetchPrefs();
  }

  bool scrollListener(ScrollNotification scrollInfo) {
    RenderBox box = key.currentContext.findRenderObject();
    Offset position = box.localToGlobal(Offset.zero);
    double y = position.dy;
    if (scrollInfo.metrics.axis == Axis.vertical) {
      colorAnimationController.animateTo(scrollInfo.metrics.pixels / 100);

      if (y > 83) {
        setState(() {
          secondAppBar = false;
          print(y);
        });
        if (scrollInfo.metrics.pixels > 100) {
          setState(() {
            brightnessCutom = Brightness.dark;
            print(y);
          });
        } else {
          setState(() {
            brightnessCutom = Brightness.light;
            print(y);
          });
        }
      } else if (y < 83) {
        setState(() {
          secondAppBar = true;

          print(y);
        });

        if (y > 50) {
          setState(() {
            containerHeight = 80;
          });
        } else if (y < 20) {
          setState(() {
            containerHeight = 60;
          });
        }
      }

      return true;
    }
    return null;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    List<Produk> produks = dummyProduk.sublist(0, 4);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: brightnessCutom),
      child: Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: scrollListener,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  controller: scrollControlllerSingle,
                  child: Column(
                    children: [
                      // NOTE: Carousel Slider
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: mainColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                enableInfiniteScroll: true,
                                height: 250,
                                enlargeCenterPage: false,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    current = index;
                                  });
                                },
                              ),
                              items: imgList
                                  .map(
                                    (item) => Container(
                                      width: double.infinity,
                                      height: 250,
                                      child: Container(
                                        width: double.infinity,
                                        child: Image.network(
                                          item,
                                          fit: BoxFit.fill,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: widthSize,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultMargin),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: imgList.map((e) {
                                  int index = imgList.indexOf(e);
                                  return Container(
                                    height: 8,
                                    width: 8,
                                    margin: EdgeInsets.only(
                                        left: index == 0 ? 4 : 8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: current == index
                                          ? mainColor
                                          : accentColor3.withOpacity(0.2),
                                    ),
                                  );
                                }).toList(),
                              ),
                              Text(
                                "Lihat Semua Promo",
                                style: greenTextFont.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // NOTE: Scan, Ovo, Promo
                      Container(
                        width: widthSize - 2 * defaultMargin,
                        height: 55,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border:
                              Border.all(width: 1, color: Color(0xFFE4E4E4)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        height: 24,
                                        width: 24,
                                        child: SvgPicture.asset(
                                            "assets/icons/scan.svg")),
                                  ),
                                  Text(
                                    "Scan",
                                    style: greyTextFont.copyWith(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: VerticalDivider(
                                width: 2,
                                thickness: 1.5,
                                color: Color(0xFFE4E4E4),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.purple[900],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 4,
                                                  color: Colors.white,
                                                ),
                                                color: Colors.purple[900]),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "OVO",
                                            style: blackTextFont.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text("Aktivasi",
                                              style: greenTextFont.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: VerticalDivider(
                                width: 2,
                                thickness: 1.5,
                                color: Color(0xFFE4E4E4),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Image.asset(
                                          "assets/img/promo.png",
                                          fit: BoxFit.contain,
                                          width: 25,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: 15,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2, vertical: 1),
                                            decoration: BoxDecoration(
                                                color: Color(0xFFF75F84),
                                                borderRadius:
                                                    BorderRadius.circular(2)),
                                            child: Center(
                                              child: Text(
                                                "PROMO",
                                                style: whiteTextFont.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.22,
                                            child: Text(
                                              "3 Kupon Baru!",
                                              style: greenTextFont.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // NOTE: Menu List
                      Container(
                        height: 80,
                        width: widthSize,
                        margin: EdgeInsets.symmetric(vertical: 16),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: menuList.length,
                          itemBuilder: (_, int index) {
                            return Container(
                              margin: EdgeInsets.only(
                                right: (index == menuList.length) ? 0 : 16,
                                left: (index == 0) ? defaultMargin : 0,
                              ),
                              child: MenuList(
                                title: menuList[index].title,
                                icon: menuList[index].icon,
                              ),
                            );
                          },
                        ),
                      ),
                      //  NOTE: Kerjar Diskon, lihat semua
                      Container(
                        height: 50,
                        width: widthSize,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Kejar Diskon Spesial",
                                  style: blackTextFont.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Berakhir dalam ",
                                      style: blackTextFont.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Container(
                                      height: 25,
                                      width: 25,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2.5),
                                      decoration: BoxDecoration(
                                        color: accentColor2,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "00",
                                          textAlign: TextAlign.center,
                                          style: whiteTextFont.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                        color: accentColor2,
                                      ),
                                    ),
                                    Container(
                                      height: 25,
                                      width: 25,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2.5),
                                      decoration: BoxDecoration(
                                        color: accentColor2,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Center(
                                        child: Text(
                                          minuteShow >= 10
                                              ? minuteShow.toString()
                                              : "0" + minuteShow.toString(),
                                          textAlign: TextAlign.center,
                                          style: whiteTextFont.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      ":",
                                      style: TextStyle(
                                        color: accentColor2,
                                      ),
                                    ),
                                    Container(
                                      height: 25,
                                      width: 25,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2.5),
                                      decoration: BoxDecoration(
                                        color: accentColor2,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Center(
                                        child: Text(
                                          secondCountdown >= 10
                                              ? secondCountdown.toString()
                                              : "0" +
                                                  secondCountdown.toString(),
                                          textAlign: TextAlign.center,
                                          style: whiteTextFont.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "Lihat Semua",
                                  style: greenTextFont.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: 300,
                        width: widthSize,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(vertical: 25),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              mainColor,
                              Colors.deepPurple,
                            ],
                          ),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: produks.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                                left: (index == 0) ? defaultMargin : 0,
                                right: (index == produks.length)
                                    ? defaultMargin
                                    : 10,
                              ),
                              child: ProdukCard(
                                produk: produks[index],
                                isPromo: true,
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        key: key,
                        height: 80,
                        width: widthSize,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.white,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dummyKategori.length,
                          itemBuilder: (_, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: (index == 0) ? defaultMargin : 0,
                                right: (index == dummyKategori.length)
                                    ? defaultMargin
                                    : 10,
                              ),
                              child: KategoriCard(
                                namaKategori: dummyKategori[index].namaKategori,
                                color: dummyKategori[index].ketegoriColor,
                                isSelected:
                                    (index == selectedkategori) ? true : false,
                                width: 100,
                                onTap: () {
                                  setState(() {
                                    selectedkategori = index;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: listOfProduk(context, 300),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
              createAppBarAnimation(),
              (secondAppBar == true)
                  ? Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: AnimatedSize(
                        curve: Curves.slowMiddle,
                        duration: Duration(seconds: 5),
                        reverseDuration: Duration(seconds: 5),
                        alignment: Alignment.topCenter,
                        vsync: this,
                        child: Container(
                          width: widthSize,
                          height: containerHeight,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: accentColor3.withOpacity(0.2),
                                blurRadius: 5,
                                offset: Offset(0, 5),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dummyKategori.length,
                            itemBuilder: (_, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                  left: (index == 0) ? defaultMargin : 0,
                                  right: (index == dummyKategori.length)
                                      ? defaultMargin
                                      : 10,
                                ),
                                child: KategoriCard(
                                  namaKategori:
                                      dummyKategori[index].namaKategori,
                                  color: dummyKategori[index].ketegoriColor,
                                  isSelected: (index == selectedkategori)
                                      ? true
                                      : false,
                                  width: 100,
                                  onTap: () {
                                    setState(() {
                                      selectedkategori = index;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  // NOTE: AppBar Animation
  Widget createAppBarAnimation() => AnimatedBuilder(
        animation: colorAnimationController,
        builder: (context, child) => Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: appBarColorTween.value,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: defaultMargin, right: defaultMargin, bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.58,
                        height: 40,
                        decoration: BoxDecoration(
                          color: fieldColorTween.value,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Center(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  size: 20,
                                  color: accentColor3.withOpacity(0.7),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Cari mi box s",
                                  style: greyTextFont.copyWith(fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        child: Icon(Icons.favorite,
                            size: 24, color: iconColorTween.value),
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        child: Icon(Icons.mail,
                            size: 24, color: iconColorTween.value),
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        child: Icon(Icons.notifications,
                            size: 24, color: iconColorTween.value),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  List<Widget> listOfProduk(BuildContext context, double height) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 10) / 2;

    List<Produk> produks = dummyProduk.sublist(4, 10);

    return produks
        .map((e) => ProdukCard(
              produk: e,
              height: height,
              width: width,
            ))
        .toList();
  }
}
