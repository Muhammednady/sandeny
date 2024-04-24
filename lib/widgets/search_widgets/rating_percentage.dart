import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/modules/filter/controllers/filter_controller.dart';
import '../../constants/colors_manager.dart';
import '../../constants/images_manager.dart';
import '../../constants/styles_manager.dart';

Widget ratingPercentage(BuildContext context) {
  var controller = Get.put(FilterController());
  return Row(
    children: [
      SvgPicture.asset(
        Images.starIcon2,
        color: ColorsManager.primaryColor,
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        'rating-percentage'.tr,
        style: getMediumStyle(
          color: ColorsManager.blackColor,
          fontSize: 14,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: RatingBar.builder(
          initialRating: 1,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 30,
          itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          unratedColor: ColorsManager.lightGreyColor,
          itemBuilder: (context, _) => SvgPicture.asset(
            Images.starIcon2,
          ),
          onRatingUpdate: (rating) {
            controller.selectRatingPercentage(rating);
          },
        ),
      ),
    ],
  );
}
