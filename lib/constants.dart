import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

const baseURLAPI = 'https://dipojournal.doltinuku.id/api/';
const baseURLImg = 'https://dipojournal.doltinuku.id/assets/img/';
const baseURLPostDetail = 'https://dipojournal.doltinuku.id/post/detail/';

const kGrey1 = Color(0xFF9F9F9F);
const kGrey2 = Color(0xFF6D6D6D);
const kGrey3 = Color(0xFFEAEAEA);
const kBlack = Color(0xFF1C1C1C);

var kNonActiveTabStyle = GoogleFonts.roboto(
  textStyle: TextStyle(fontSize: 14.0, color: kGrey1),
);

var kActiveTabStyle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 16.0,
    color: kBlack,
    fontWeight: FontWeight.bold,
  ),
);

var kCategoryTitle = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14.0,
    color: kGrey2,
    fontWeight: FontWeight.bold,
  ),
);

var kDetailContent = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 14.0,
    color: kGrey2,
  ),
);

var kTitleCard = GoogleFonts.roboto(
  textStyle: TextStyle(
    fontSize: 18.0,
    color: kBlack,
    fontWeight: FontWeight.bold,
  ),
);

var descriptionStyle = GoogleFonts.roboto(
    textStyle: TextStyle(
  fontSize: 15.0,
  height: 2.0,
));

String convertDate(DateTime dateTime, bool isFull) {
  if (isFull) {
    return DateFormat('EEEE, d MMM, yyyy').format(dateTime);
  } else {
    return DateFormat('EE, d MMM, yyyy').format(dateTime);
  }
}

String convertTime(DateTime dateTime) {
  DateFormat dateFormat = DateFormat('').add_jms();
  return dateFormat.format(dateTime);
}
