import 'package:flutter/material.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';

import '../../../data/models/contact_model.dart';
import '../../../utils/colors/app_colors.dart';

class ContactItems extends StatelessWidget {
  const ContactItems(
      {super.key, required this.contactModel, required this.onTap});

  final ContactModel contactModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 16.h),
          child: Row(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.w),
                    child: Image.network(
                      contactModel.imageUrl,
                      width: 48.w,
                      height: 48.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  contactModel.isOnline
                      ? Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(100.w),
                        border: Border.all(
                          width: 2.w,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                      : const SizedBox(),
                ],
              ),
              16.getW(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${contactModel.contactName} ${contactModel.contactLasName}',
                        style: TextStyle(
                          color: const Color(0xFF0F1828),
                          fontSize: 14.w,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "${contactModel.lastOnlineTime.hour}:${contactModel.lastOnlineTime.minute}am",
                        style: TextStyle(
                          color: const Color(0xFFA4A4A4),
                          fontSize: 10.w,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  2.getH(),
                  Text(
                    "Siz bilan xabarlashganimdan juda mamnunman",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color(0xFFADB5BD),
                      fontSize: 11.w,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}