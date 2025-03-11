import 'package:e_commerce/feature/app/Domain_layer/Entities/ProductResponseEntity.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/category_screen/bloc/product_view_model.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/category_screen/page/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/Theme/theme_manager.dart';



class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.productEntity});

  List<ProductEntity> productEntity;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: GridView.builder(
        itemCount: productEntity.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.4,
          // 0.9 / 1.1
          mainAxisSpacing: 10.sp,
          crossAxisSpacing: 10.sp,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () =>  Navigator.pushNamed(context,ProductDetails.routName,arguments: productEntity[index]),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: 220.w,
                  height: 250.h,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(
                          color: ThemeManager.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(15.sp)),
                  child: Image.network(
                    productEntity[index].imageCover ?? '',
                    fit: BoxFit.cover,
                    width: 191.w,
                    height: 128.h,
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/fav.png'),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.all(5.sp),
                      width: 210.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(
                              color: ThemeManager.primaryColor, width: 1),
                          color: ThemeManager.whiteColor
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productEntity[index].title != null &&
                                productEntity[index].title!.length > 20
                                ? '${productEntity[index].title!.substring(
                                0, 20)}...'
                                : productEntity[index].title ?? '',
                            style: ThemeManager
                                .appTheme.textTheme.titleMedium
                                ?.copyWith(
                                color: ThemeManager.blackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w900),
                          ),
                          3.verticalSpace,
                          Text(
                            'EGP  ${productEntity[index].price}',
                            style: ThemeManager
                                .appTheme.textTheme.titleMedium
                                ?.copyWith(
                                color: ThemeManager.blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          // 5.verticalSpace,
                          Row(
                            children: [
                              Text('Review (${productEntity[index]
                                  .ratingsAverage})'),
                              5.horizontalSpace,
                              const Icon(
                                Icons.star,
                                color: Color(0xfffdd835),
                              ),
                              20.horizontalSpace,
                              InkWell(
                                onTap: () {
                                  // add to cart
                                  ProductViewModel.get(context).addToCart(productEntity[index].id ?? '');
                                },
                                child: Image.asset(
                                  'assets/images/add.png', width: 30.w,
                                  height: 30.h,
                                  fit: BoxFit.fill,),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
