import 'package:flutter/material.dart';
import 'package:Ever/template/colors.dart';
import 'package:Ever/template/eventCard.dart';
import 'package:Ever/template/donationBottomSheet.dart';
import 'package:Ever/template/sponsorBottomSheet.dart';
import 'package:Ever/template/volunteerBottomSheet.dart';

Widget divisionContent(List division) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (var div in division)
        Text(
          div['divisionName'].toString(),
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            color: white,
          ),
        )
    ],
  );
}

Widget eventButton(isNonProfit, context) {
  if (isNonProfit == true) {
    return FlatButton(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          'Be a Donator',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              color: white,
              fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {
        donationBottomSheet(context);
      },
    );
  } else {
    return FlatButton(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          'Be a Sponsor',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              color: white,
              fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {
        sponsorBottomSheet(context);
      },
    );
  }
}

void eventDetailBottomSheet(context,
    {String eventName,
    bool isNonProfit,
    String eventThumb,
    String eventDate,
    String eventTime,
    String eventPlace,
    String eventDesc,
    String eventCriteria,
    List eventDivision,
    String eventBenefits,
    String eventOrganizer,
    String bankAccount,
    String bankAccountName,
    String packageName,
    String packageContent,
    String packagePrice}) {
  divisionContent(eventDivision);
  showBottomSheet(
    context: context,
    elevation: 0,
    builder: (BuildContext bc) {
      return FractionallySizedBox(
        heightFactor: (MediaQuery.of(context).size.height) /
            MediaQuery.of(context).size.height,
        child: Container(
          height: 1000,
          decoration: BoxDecoration(
            color: darkBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(170, 10, 170, 0),
                child: Container(
                  height: 7,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.95,
                minChildSize: 0.5,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(eventThumb)),
                                  borderRadius: BorderRadius.circular(10)),
                              width: 350,
                              height: 180,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                      right: 10.0,
                                      bottom: 10.0,
                                      child: isNonProfit
                                          ? eventType(isNonProfit)
                                          : Text('')),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("$eventName",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text("$eventDate, $eventTime",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.red,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                            Text("$eventPlace",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 30,
                            ),
                            Text("Description",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold)),
                            Text("$eventDesc",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 12)),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Criteria",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold)),
                            Text("$eventCriteria",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 12)),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Division",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold)),
                            divisionContent(eventDivision),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Benefits",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold)),
                            Text("$eventBenefits",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 12)),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Event Organized by: $eventOrganizer",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 70,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          bottom: 10,
                          right: 210,
                          child: eventButton(isNonProfit, context),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          bottom: 10,
                          left: 210,
                          child: FlatButton(
                            color: orange,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Volunteer',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    color: white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            onPressed: () {
                              volunteerBottomSheet(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: darkBackgroundColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}