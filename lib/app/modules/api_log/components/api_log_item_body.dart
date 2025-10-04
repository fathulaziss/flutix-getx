import 'package:flutix/app/modules/api_log/components/api_log_text_copy.dart';
import 'package:flutix/app/modules/api_log/models/api_log_model.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ApiLogItemBody extends StatelessWidget {
  const ApiLogItemBody({super.key, required this.data});

  final ApiLogModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (data.payload != 'null')
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4.w),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: Colors.indigo.withValues(alpha: .3),
                  ),
                  child: Text(
                    'PAYLOAD',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
                      fontSize: 10.w,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ApiLogTextCopy(
                  text: data.payload,
                  style: TextStyle(
                    fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
                    fontSize: 13.w,
                  ),
                ),
              ],
            ),
          )
        else
          const SizedBox(),
        if (data.response.isNotEmpty)
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 4.w,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.w),
                    color: Colors.green.withValues(alpha: .3),
                  ),
                  child: Text(
                    'RESPONSE',
                    style:
                        TextStyles.desc.copyWith(color: Colors.green.shade700),
                  ),
                ),
                ApiLogTextCopy(
                  text: data.response,
                  style: TextStyle(
                    fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
                    fontSize: 13.w,
                  ),
                ),
              ],
            ),
          )
        else
          const SizedBox(),
        if (data.error.isNotEmpty)
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4.w),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    color: Colors.red.withValues(alpha: .3),
                  ),
                  child: Text(
                    'ERROR',
                    style: TextStyles.desc.copyWith(color: Colors.red.shade700),
                  ),
                ),
                ApiLogTextCopy(
                  text: data.error,
                  style: TextStyle(
                    fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
                    fontSize: 13.w,
                  ),
                ),
              ],
            ),
          )
        else
          const SizedBox(),
      ],
    );
  }
}
