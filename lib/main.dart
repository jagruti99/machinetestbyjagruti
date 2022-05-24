import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(MyApp());
}

const Color p = Color(0xff416d69);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Machine Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: p,
      ),
      home: Zoom(),
    );
  }
}

final ZoomDrawerController z = ZoomDrawerController();

class Zoom extends StatefulWidget {
  const Zoom({Key? key}) : super(key: key);

  @override
  _ZoomState createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuBackgroundColor: Color(0xffFFFFFF),
      menuScreenOverlayColor: Color(0xffF5F5F5),
      controller: z,
      borderRadius: 24,
      style: DrawerStyle.defaultStyle,
      drawerShadowsBackgroundColor: Color(0xffF5F5F5),
      showShadow: true,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      angle: 0.0,
      mainScreen: const Body(),
      menuScreen: Theme(
        data: ThemeData.light(),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              children: [
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: Image.asset('images/i2.png'),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  "Emily Cyrus",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alegreyaSans(
                      fontSize: 20,
                      color: Color(0xffE36DA6),
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Home",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.alegreyaSans(
                          fontSize: 18,
                          color: Color(0xff262F71),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Divider(
                  color: Color(0xffE36DA6),
                  indent: 15,
                  thickness: 1.0,
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Book A Nanny",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.alegreyaSans(
                          fontSize: 18,
                          color: Color(0xff262F71),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Divider(
                  color: Color(0xffE36DA6),
                  indent: 15,
                  thickness: 1.0,
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "How It Works",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.alegreyaSans(
                          fontSize: 18,
                          color: Color(0xff262F71),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),

                Divider(
                  color: Color(0xffE36DA6),
                  indent: 15,
                  thickness: 1.0,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 10.0),
                //   child: Container(
                //     color: Color(0xffE36DA6),
                //     height: 1,
                //     // indent: 15,
                //   ),
                // ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Why Nanny Vanny",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.alegreyaSans(
                          fontSize: 18,
                          color: Color(0xff262F71),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Divider(
                  color: Color(0xffE36DA6),
                  indent: 15,
                  thickness: 1.0,
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "My Bookings",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.alegreyaSans(
                          fontSize: 18,
                          color: Color(0xff262F71),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Divider(
                  color: Color(0xffE36DA6),
                  indent: 15,
                  thickness: 1.0,
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "My Profile",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.alegreyaSans(
                          fontSize: 18,
                          color: Color(0xff262F71),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Divider(
                  color: Color(0xffE36DA6),
                  indent: 15,
                  thickness: 1.0,
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Support",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.alegreyaSans(
                          fontSize: 18,
                          color: Color(0xff262F71),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),

                SizedBox(
                  height: 60,
                )
              ],
            )),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  final widgetOptions = [
    Text('Beer List'),
    Text('Add new beer'),
    Text('Favourites'),
  ];
  final tabList = ['Tab 1', 'Tab 2'];
  late TabController _tabController;

  late AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
    value: -1.0,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool get isPanelVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.text_alignright,
              color: Color(0xffE36DA6),
              size: 22,
            ),
            onPressed: () {
              z.toggle!();
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: TabBar(
        // isScrollable: true,
        labelColor: Color(0xffE36DA6),
        unselectedLabelColor: Color(0xff5C5C5C),
        unselectedLabelStyle: GoogleFonts.alegreyaSans(
            fontSize: 10,
            color: Color(0xff262F71),
            fontWeight: FontWeight.w500),

        labelStyle: GoogleFonts.alegreyaSans(
            fontSize: 10,
            color: Color(0xffE36DA6),
            fontWeight: FontWeight.w500),

        controller: _tabController,
        indicator: PointTabIndicator(
          position: PointTabIndicatorPosition.bottom,
          color: Color(0xffE36DA6),
          insets: EdgeInsets.only(bottom: 6),
        ),

        tabs: [
          Tab(
              text: "Home",
              icon: Icon(
                Icons.home_outlined,
                size: 22,
              )),
          Tab(
            text: "Packages",
            icon: Stack(
              children: <Widget>[
                Center(
                  child: Icon(
                    CupertinoIcons.circle,
                    size: 22,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.percent_sharp,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
          Tab(
              text: "Bookings",
              icon: Icon(
                Icons.access_time,
                size: 22,
              )),
          Tab(
              text: "Profile",
              icon: Icon(
                Icons.person_outline,
                size: 22,
              )),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePage(),
          Center(child: Text("Packages")),
          Center(child: Text("Bookings")),
          Center(child: Text("Profile")),
        ],
      ),
    );

    // body: Text("DATA "));
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
