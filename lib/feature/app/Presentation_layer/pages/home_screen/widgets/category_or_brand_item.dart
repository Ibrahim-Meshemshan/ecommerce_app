
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Domain_layer/Entities/CategoryResponseOrBrandEntity.dart';

class CategoryOrBrandItem extends StatelessWidget {
  CategoryOrBrandItem({super.key,required this.entity});


  List<CategoryOrBrandEntity> entity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200.h,
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: entity.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.2,
            crossAxisCount: 2,
            crossAxisSpacing: 10.sp,
            // mainAxisSpacing: 10.sp
          ),
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundImage:
                    NetworkImage(
                      entity[index].image?.isNotEmpty == true
                          ? entity[index].image!
                          : 'https://via.placeholder.com/150',
                    )
                  ),
                ),
                10.verticalSpace,
                Expanded(
                  flex: 2,
                  child: Text(
                    entity[index].name ?? '',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            );
          },
        ));
  }
}
