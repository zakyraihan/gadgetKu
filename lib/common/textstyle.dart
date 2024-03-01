import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle poppins(double fs, FontWeight fw, [Color? colors]) {
  return GoogleFonts.poppins(fontSize: fs, color: colors, fontWeight: fw);
}

TextStyle cormorantGaramond(
  double fs,
  FontWeight fw,
  Color colors,
) {
  return GoogleFonts.cormorantGaramond(
    fontSize: fs,
    color: colors,
    fontWeight: fw,
  );
}

TextStyle openSans(
  double fs,
  FontWeight fw,
  Color colors,
) {
  return GoogleFonts.openSans(
    fontSize: fs,
    color: colors,
    fontWeight: fw,
  );
}

TextStyle roboto(
  double fs,
  FontWeight fw,
  Color colors,
) {
  return GoogleFonts.roboto(
    fontSize: fs,
    color: colors,
    fontWeight: fw,
  );
}
