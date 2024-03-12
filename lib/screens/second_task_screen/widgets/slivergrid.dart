import 'package:flutter/material.dart';
import 'package:my_default_project/utils/images/app_images.dart';

class ProductItemsGrid extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: 10.0, // Vertical spacing between grid items
        crossAxisSpacing: 10.0, // Horizontal spacing between grid items
        childAspectRatio: 1.0, // Aspect ratio of each grid item (square)
      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          // Return a container with white background color and an image
          return Container(
            color: Colors.white,
            child: Image.asset(
              getImagePath(index), // Get image path based on index
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: 5, // Total number of grid items (images)
      ),
    );
  }

  // Helper function to get image path based on index
  String getImagePath(int index) {
    switch (index) {
      case 0:
        return AppImages.img_1;
      case 1:
        return AppImages.img_2;
      case 2:
        return AppImages.img_3;
      case 3:
        return AppImages.img_4;
      case 4:
        return AppImages.img_5;
      default:
        return ''; // Handle other cases if needed
    }
  }

  @override
  double get maxExtent => 150.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
