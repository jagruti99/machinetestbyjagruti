import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;
  String packagelabel = "";
  String fromdate = "";

  String fromtime = "";

  String todate = "";

  String totime = "";

  List packlist = [];

  List<String> numlist = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    "Ten",
    'Eleven',
    'Twelve',
    'Thirteen',
    'Fourteen',
    'Fifteen',
    'Sixteen',
    'Seventeen',
    'Eighteen',
    'Nineteen',
    "Twenty",
    'Twenty One',
    'Twenty Two',
    'Twenty Three',
    'Twenty Four',
    'Twenty Five',
    'Twenty Six',
    'Twenty Seven',
    'Twenty Eight',
    'Twenty Nine',
    "Thirty",
    'Thirty One'
  ];

  getcurrentbooking() async {
    var response = await http.get(Uri.parse('http://cgprojects.in/flutter/'));

    var data = json.decode(response.body);

    print("DATA");
    print(data);
    return data;
  }

  //   getvehiclelistFiltered().then((data) {
  //     setState(() {
  //       vehiclelist = data;
  //       vehiclelistFiltered = vehiclelist;

  //       if (vehiclelistFiltered.length == 0) {
  //         setState(() {
  //           test = true;
  //           circle = false;
  //         });
  //       }
  //     });
  //   });

  // getvehiclelistFiltered() async {

  //    var response = await http.get(
  //       Uri.parse('https://gasproplus.com/api/$r/getvehiclesList'),
  //       // body: param,
  //       headers: {
  //         "Accept": "application/json",
  //         "Authorization": "Bearer $token1"
  //       });

  //   var data = json.decode(response.body);

  //   return data;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getcurrentbooking().then((data) {
      print("DD");
      print(data['current_bookings']);

      setState(() {
        packagelabel = data['current_bookings']['package_label'].toString();
        fromdate = data['current_bookings']['from_date'].toString();

        fromtime = data['current_bookings']['from_time'].toString();

        todate = data['current_bookings']['to_date'].toString();

        totime = data['current_bookings']['to_time'].toString();

        packlist = data['packages'];
        print("PACKLIST");
        print(packlist);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(
                'images/i1.png',
                height: 53,
                width: 53,
              ),
              title: Text(
                "Welcome",
                style: GoogleFonts.alegreyaSans(
                    fontSize: 16,
                    color: Color(0xff5C5C5C),
                    fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                "Emily Cyrus",
                style: GoogleFonts.alegreyaSans(
                    fontSize: 20,
                    color: Color(0xffE36DA6),
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Card(
                    color: Color(0xffF5B5CF),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadowColor: const Color(0xffF7CBAB),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 35,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Nanny And\nBabysitting Services',
                            style: GoogleFonts.alegreyaSans(
                                color: Color(0xff262F71),
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 25,
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Color(0xff262F71),
                              child: Text(
                                'Book Now',
                                style: GoogleFonts.alegreyaSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 9),
                              ),
                              onPressed: () {},
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: -95,
                    top: -30,
                    child: Image.asset(
                      'images/r1.png',
                      height: 215,
                      width: 600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Your Current Booking",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.alegreyaSans(
                        fontSize: 20,
                        color: Color(0xff262F71),
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          packagelabel.toString(),
                          style: GoogleFonts.alegreyaSans(
                              fontSize: 16,
                              color: Color(0xffE36DA6),
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          height: 25,
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Color(0xffE36DA6),
                            child: Text(
                              'Start',
                              style: GoogleFonts.alegreyaSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9),
                            ),
                            onPressed: () {},
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              // textAlign: TextAlign.left,
                              style: GoogleFonts.alegreyaSans(
                                  fontSize: 12,
                                  color: Color(0xff5C5C5C),
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Text(
                              "To",
                              // textAlign: TextAlign.left,
                              style: GoogleFonts.alegreyaSans(
                                  fontSize: 12,
                                  color: Color(0xff5C5C5C),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Color(0xffE36DA6),
                              size: 10,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              fromdate.toString(),
                              style: GoogleFonts.alegreyaSans(
                                  fontSize: 16,
                                  color: Color(0xff5C5C5C),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Color(0xffE36DA6),
                              size: 10,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              todate.toString(),
                              style: GoogleFonts.alegreyaSans(
                                  fontSize: 16,
                                  color: Color(0xff5C5C5C),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Color(0xffE36DA6),
                              size: 10,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              fromtime.toString(),
                              style: GoogleFonts.alegreyaSans(
                                  fontSize: 16,
                                  color: Color(0xff5C5C5C),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 125,
                            ),
                            Icon(
                              Icons.access_time,
                              color: Color(0xffE36DA6),
                              size: 10,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              totime.toString(),
                              style: GoogleFonts.alegreyaSans(
                                  fontSize: 16,
                                  color: Color(0xff5C5C5C),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 25,
                          child: RaisedButton.icon(
                            icon: Icon(
                              Icons.star_border_outlined,
                              color: Colors.white,
                              size: 12,
                            ),
                            textColor: Colors.white,
                            color: Color(0xff262F71),
                            label: Text(
                              'Rate Us',
                              style: GoogleFonts.alegreyaSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9),
                            ),
                            onPressed: () {},
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        Container(
                          height: 25,
                          child: RaisedButton.icon(
                            icon: Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 12,
                            ),
                            textColor: Colors.white,
                            color: Color(0xff262F71),
                            label: Text(
                              'Geolocation',
                              style: GoogleFonts.alegreyaSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9),
                            ),
                            onPressed: () {},
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        Container(
                          height: 25,
                          child: RaisedButton.icon(
                            icon: Icon(
                              Icons.settings_voice_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                            textColor: Colors.white,
                            color: Color(0xff262F71),
                            label: Text(
                              'Survillence',
                              style: GoogleFonts.alegreyaSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9),
                            ),
                            onPressed: () {},
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Packages",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.alegreyaSans(
                        fontSize: 20,
                        color: Color(0xff262F71),
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),

            ListView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                itemCount: packlist.length,
                itemBuilder: (BuildContext context, int index) {
                  int n = int.parse(packlist[index]['id'].toString());
                  // print(packlist[index]['package_name']
                  //     .toString()
                  //     .replaceAll("Day", "/"));

                  String strValue = packlist[index]['package_name']
                      .toString()
                      .replaceAll("Day", "/");
                  var ch = '/';

                  List listOfWords = strValue.split(ch);
                  if (listOfWords.length.toInt() > 0) strValue = listOfWords[0];
                  print(strValue);
                  print(numlist);
                  // print(numlist.contains(strValue.toString()));

                  List myList = ['One', "1", false];

                  var r1 = numlist.contains(strValue.trim());
                  var r2 = numlist.indexOf(strValue.trim()) + 1;
                  print(numlist.indexOf(strValue.trim()) + 1);
                  // var r2 = myList.contains("1");
                  // var r3 = myList.contains(true);

                  print(r1); // true
                  // print(r2); // true
                  // print(r3);

                  // print(numlist
                  //     .contains(packlist[index]['package_name'].toString()));
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Card(
                      color: n % 2 == 0 ? Color(0xff80ABDB) : Color(0xffF0B3CD),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Icon(
                                        Icons.calendar_today_outlined,
                                        color: n % 2 == 0
                                            ? Color(0xff0098D0)
                                            : Color(0xffE36DA6),
                                        size: 32,
                                      ),
                                    ),
                                    Center(
                                        child: Text(
                                      r2.toString(),
                                      style: GoogleFonts.alegreyaSans(
                                          fontSize: 21,
                                          color: n % 2 == 0
                                              ? Color(0xffFFFFFF)
                                              : Color(0xffD84D90),
                                          fontWeight: FontWeight.normal),
                                    ))
                                  ],
                                ),
                                Container(
                                  height: 25,
                                  child: RaisedButton(
                                    textColor: Colors.white,
                                    color: n % 2 == 0
                                        ? Color(0xff0098D0)
                                        : Color(0xffE36DA6),
                                    child: Text(
                                      'Book Now',
                                      style: GoogleFonts.alegreyaSans(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 9),
                                    ),
                                    onPressed: () {},
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  packlist[index]['package_name'].toString(),
                                  style: GoogleFonts.alegreyaSans(
                                      color: Color(0xff262F71),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                Text(
                                  "₹ " + packlist[index]['price'].toString(),
                                  style: GoogleFonts.alegreyaSans(
                                      color: Color(0xff262F71),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ReadMoreText(
                              packlist[index]['description'].toString(),
                              trimLines: 2,
                              colorClickableText: Colors.pink,
                              style: GoogleFonts.alegreyaSans(
                                  color: Color(0xff494949),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              moreStyle: GoogleFonts.alegreyaSans(
                                  color: Color(0xff494949),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
            // Container(
            //   child: ListView(
            //     shrinkWrap: true,
            //     primary: false,
            //     physics: NeverScrollableScrollPhysics(),
            //     children: [
            //       Card(
            //         child: Padding(
            //           padding: const EdgeInsets.all(12.0),
            //           child: Column(
            //             children: [
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Stack(
            //                     alignment: Alignment.center,
            //                     children: <Widget>[
            //                       Center(
            //                         child: Icon(
            //                           Icons.calendar_today_outlined,
            //                           color: Color(0xffE36DA6),
            //                           size: 32,
            //                         ),
            //                       ),
            //                       Center(
            //                           child: Text(
            //                         "05",
            //                         style: GoogleFonts.alegreyaSans(
            //                             fontSize: 20,
            //                             color: Color(0xffE36DA6),
            //                             fontWeight: FontWeight.normal),
            //                       ))
            //                     ],
            //                   ),
            //                   Container(
            //                     height: 25,
            //                     child: RaisedButton(
            //                       textColor: Colors.white,
            //                       color: Color(0xffE36DA6),
            //                       child: Text(
            //                         'Book Now',
            //                         style: GoogleFonts.alegreyaSans(
            //                             color: Colors.white,
            //                             fontWeight: FontWeight.w500,
            //                             fontSize: 9),
            //                       ),
            //                       onPressed: () {},
            //                       shape: new RoundedRectangleBorder(
            //                         borderRadius:
            //                             new BorderRadius.circular(30.0),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),

            //             ],
            //           ),
            //         ),
            //       ),
            //       Text("data"),
            //       Text("data"),
            //       Text("data"),
            //       Text("data"),
            //       Text("data"),
            //       Text("data"),
            //     ],
            //   ),
            // )
          ],
        ),
      )),
    );
  }
}
