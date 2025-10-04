import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ApiLogCardStatus extends StatelessWidget {
  const ApiLogCardStatus({super.key, required this.status});

  final String status;

  Color getMethodColor(String method) {
    if (method.toLowerCase().contains('get')) {
      return Colors.green.withValues(alpha: .3);
    } else if (method.toLowerCase().contains('post')) {
      return Colors.amber.withValues(alpha: .3);
    } else {
      return Colors.grey.withValues(alpha: .3);
    }
  }

  Color getTextColor(String method) {
    if (method.toLowerCase().contains('get')) {
      return Colors.green.shade800;
    } else if (method.toLowerCase().contains('post')) {
      return Colors.amber.shade800;
    } else {
      return Colors.grey.shade800;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: getMethodColor(status),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: getTextColor(status),
          fontFamily: GoogleFonts.robotoMono().fontFamily,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
