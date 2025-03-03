import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: deviceHeight * 0.02,
        start: deviceHeight * 0.02,
        end: deviceHeight * 0.02,
      ),
      child: ListView(
        children: <Widget>[
          Row(
            children: [
              Spacer(),
              ClipOval(
                child: SizedBox(
                  width:
                      120.h, // Set the width and height to control the size of the circle
                  height: 120.h,
                  child: SvgPicture.asset(
                    'assets/images/tawaky.svg', // Path to your SVG file
                    fit:
                        BoxFit
                            .cover, // Ensure the image covers the circular area
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: deviceHeight * 0.01),
          Center(
            child: Text(
              'Peter Tawaky',
              style: TextStyle(
                color: AppColors.primaryBlack,
                fontWeight: FontWeight.bold,
                fontSize: 20.w,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Center(
            child: Text(
              'Fresh Flutter Developer',
              style: TextStyle(fontSize: 18, color: AppColors.primaryBlack),
            ),
          ),
          SizedBox(height: deviceHeight * 0.02),
          Text(
            'Summary',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.w,
              letterSpacing: 1.2,
              color: AppColors.primaryBlack,
            ),
          ),
          Text(
            'Experienced Flutter Developer with over 5 years of hands-on experience in mobile app development and API integration.Proficient in Flutter, Dart, and Dart/Flutter SDK.Strong problem-solving skills and attention to detail.Passionate about creating engaging and user-friendly mobile applications.',

            style: TextStyle(color: AppColors.primaryBlack),
          ),
          SizedBox(height: deviceHeight * 0.02),
          Text(
            'Last Projects',
            style: TextStyle(
              color: AppColors.primaryBlack,
              fontWeight: FontWeight.bold,
              fontSize: 20.w,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: deviceHeight * 0.01),
          Container(
            padding: EdgeInsets.all(deviceWidth * 0.02),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Color(0XFFECECFE),
            ),
            child: Column(
              children: [
                Text(
                  'Responsive and Adaptive App',
                  style: TextStyle(
                    color: AppColors.primaryBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.w,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  'Responsive And Adaptive Tutorial App in my\n Course so that I can make my app fit in all screens. Responsive And Adaptive Tutorial App in my Course so that i can make my app fits in all screens Responsive And Adaptive Tutorial App in my course I can make my app fit in all screens.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.primaryBlack),
                ),
              ],
            ),
          ),
          SizedBox(height: deviceHeight * 0.02),
          Container(
            padding: EdgeInsets.all(deviceWidth * 0.02),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Color(0XFFECECFE),
            ),
            child: Column(
              children: [
                Text(
                  'Our Navigation App',
                  style: TextStyle(
                    color: AppColors.primaryBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.w,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  'Responsive And Adaptive Tutorial App in my\n Course so that I can make my app fit in all screens. Responsive And Adaptive Tutorial App in my Course so that i can make my app fits in all screens Responsive And Adaptive Tutorial App in my course I can make my app fit in all screens.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.primaryBlack),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
