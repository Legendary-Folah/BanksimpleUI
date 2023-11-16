// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace, unused_import, dead_code, prefer_typing_uninitialized_variables, unused_local_variable, camel_case_types, use_key_in_widget_constructors, must_be_immutable

import 'package:bankmanagement/constants/color_constant.dart';
import 'package:bankmanagement/models/operation_model.dart';
import 'package:bankmanagement/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bankmanagement/models/card_models.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // current selected
  int current = 0;

  //Handle operator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 8),
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            children: [
              // Custom AppBar
              Container(
                margin: EdgeInsets.only(left: 18, right: 20, top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SvgPicture.asset('assets/svg/drawer_icon.svg'),
                    Container(
                      height: 55.0,
                      width: 55.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                            image: AssetImage('assets/images/user_image.png')),
                      ),
                    )
                  ],
                ),
              ),
              // Card Section
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Good Morning',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kBlackColor,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text('AMANDA ALEX',
                        style: GoogleFonts.inter(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: kBlackColor,
                        ))
                  ],
                ),
              ),
              Container(
                height: 190,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 18.0, right: 6.0),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 199,
                        width: 344,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.0),
                          color: Color(cards[index].cardBackground),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child:
                                  SvgPicture.asset(cards[index].cardElementTop),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: SvgPicture.asset(
                                  cards[index].cardElementBottom),
                            ),
                            Positioned(
                              left: 25,
                              top: 50,
                              child: Text(
                                'CARD NUMBER',
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kWhiteColor,
                                    letterSpacing: 2.0),
                              ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Positioned(
                              left: 25,
                              top: 65,
                              child: Text(
                                cards[index].cardNumber,
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: kWhiteColor,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 35,
                              child: Image.asset(
                                cards[index].cardType,
                                width: 50,
                                height: 40,
                              ),
                            ),
                            Positioned(
                              left: 25,
                              bottom: 35,
                              child: Text(
                                'CARD HOLDERNAME',
                                style: GoogleFonts.inter(
                                    letterSpacing: 1.0,
                                    color: kWhiteColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Positioned(
                              left: 25,
                              bottom: 18,
                              child: Text(
                                cards[index].user,
                                style: GoogleFonts.inter(
                                    letterSpacing: 2.0,
                                    color: kWhiteColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Positioned(
                              left: 210,
                              bottom: 35,
                              child: Text(
                                'EXPIRY DATE',
                                style: GoogleFonts.inter(
                                    letterSpacing: 2.0,
                                    color: kWhiteColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Positioned(
                              left: 210,
                              bottom: 18,
                              child: Text(
                                cards[index].cardExpired,
                                style: GoogleFonts.inter(
                                    color: kWhiteColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),

              // Operation section!
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, bottom: 18.0, top: 18.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Operation',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: kBlackColor,
                          letterSpacing: 2.0),
                    ),
                    Row(
                      children: map<Widget>(datas, (index, selected) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 10,
                          width: 10,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: current == index
                                  ? kBlueColor
                                  : kTwentyBlueColor),
                        );
                      }),
                    )
                  ],
                ),
              ),
              Container(
                height: 125,
                child: ListView.builder(
                    itemCount: datas.length,
                    padding: EdgeInsets.only(left: 18.0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: OperationCard(
                            operation: datas[index].name,
                            selectedIcon: datas[index].selectedIcon,
                            unselectedIcon: datas[index].unselectedIcon,
                            isSelected: current == index,
                            context: this),
                      );
                    }),
              ),

              // Transaction Section
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, bottom: 18.0, top: 18.0, right: 10.0),
                child: Text(
                  'Transaction History',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor,
                      letterSpacing: 1.5),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: transactions.length,
                padding: EdgeInsets.only(left: 18.0, right: 18.0),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 66,
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.only(
                        left: 18, top: 12, bottom: 12, right: 18),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                            color: kTenBlackColor,
                            blurRadius: 6,
                            spreadRadius: 4,
                            offset: Offset(5.0, 5.0))
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 55,
                              width: 54,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(transactions[index].photo!),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  transactions[index].name!,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: kBlackColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  transactions[index].date!,
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: kGreyColor,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Text(
                          transactions[index].amount!,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                            color: kBlueColor,
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OperationCard extends StatefulWidget {
  final String? operation;
  final String? selectedIcon;
  final String? unselectedIcon;
  final bool isSelected;
  HomeScreenState context;

  OperationCard(
      {Key? key,
      required this.operation,
      required this.selectedIcon,
      required this.unselectedIcon,
      required this.isSelected,
      required this.context
      })
      : super(key: key);

  @override
  State<OperationCard> createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 18),
      width: 125,
      height: 125,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: kTenBlackColor,
                blurRadius: 6,
                spreadRadius: 4,
                offset: Offset(6.0, 6.0))
          ],
          borderRadius: BorderRadius.circular(30.0),
          color: widget.isSelected ? kBlueColor : kWhiteColor),
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(widget.isSelected
                ? widget.selectedIcon!
                : widget.unselectedIcon!),
            SizedBox(
              height: 9,
            ),
            Text(widget.operation!,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: widget.isSelected ? kWhiteColor : kBlueColor))
          ],
        ),
      ),
    );
  }
}
