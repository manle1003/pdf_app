import 'package:flutter/material.dart';
import 'package:flutter_getx_base/modules/main/feed_back/rate/components/app_header.dart';
import 'package:flutter_getx_base/modules/main/feed_back/rate/components/main_button.dart';
import 'package:flutter_getx_base/modules/main/feed_back/rate/components/multiline_input.dart';
import 'package:flutter_getx_base/modules/main/feed_back/rate/components/ride_stat.dart';
import 'package:flutter_getx_base/shared/constants/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import 'rate/components/custom_app_bar.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({Key? key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  var rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const AppHeader(),
            Positioned(
              top: -380,
              left: -187,
              child: Opacity(
                opacity: 0.9,
                child: Image.asset('assets/images/img_backgroud.jpeg'),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16 * 2),
                child: Column(
                  children: [
                    CustomAppBar(),
                    Lottie.asset('assets/svgs/rate_animation.json', height: 250),
                    const SizedBox(height: 16),
                    Text(
                      'Welcome to PDF Scanner',
                      style: TextStyle(
                        color: ColorConstants.blackColor,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Your Feedback is Valuable',
                      style: TextStyle(
                        color: ColorConstants.blackColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Divider(
                      color: ColorConstants.kPrimaryLightColor,
                    ),
                    const SizedBox(height: 16),
                    const TourStats(),
                    const SizedBox(height: 16),
                    const Divider(
                      color: ColorConstants.kPrimaryLightColor,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Rate Your Experience',
                      style: TextStyle(
                        color: ColorConstants.blackColor,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'How would you rate the usage experience?',
                      style: TextStyle(
                          color: ColorConstants.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    SmoothStarRating(
                      rating: rating,
                      size: 40,
                      filledIconData: Icons.star,
                      halfFilledIconData: Icons.star_half,
                      defaultIconData: Icons.star_border,
                      starCount: 5,
                      allowHalfRating: false,
                      spacing: 2.0,
                      color: Colors.orange,
                      borderColor: Colors.orange,
                      onRatingChanged: (value) {
                        setState(() {
                          rating = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const MultilineInput(),
                    const SizedBox(height: 16),
                    const MainButton()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
