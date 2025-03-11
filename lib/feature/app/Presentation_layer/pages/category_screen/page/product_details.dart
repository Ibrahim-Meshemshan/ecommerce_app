import 'package:e_commerce/core/Theme/theme_manager.dart';
import 'package:e_commerce/feature/app/Domain_layer/Entities/ProductResponseEntity.dart';
import 'package:e_commerce/feature/app/Presentation_layer/pages/category_screen/widgets/increment_or_decrement_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatefulWidget {
  static const String routName = 'product_details';

  ProductDetails({super.key});

  int text = 1;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ProductEntity;

    return Scaffold(
      backgroundColor: ThemeManager.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: ThemeManager.primaryColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: ThemeManager.primaryColor,
            ),
          ),
        ],
        title: Text(
          'Product Details',
          style: TextStyle(
              color: ThemeManager.primaryColor, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              width: 3, color: ThemeManager.primaryColor)),
                      child: Image.network(
                        args.imageCover ?? '',
                        width: 398.w,
                        height: 300.h,
                        fit: BoxFit.fill,
                      )),
                  Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: InkWell(
                        onTap: () {},
                        child: Image.asset('assets/images/fav.png')),
                  ),
                ],
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    args.title ?? '',
                    style: ThemeManager.appTheme.textTheme.titleMedium
                        ?.copyWith(
                            color: ThemeManager.primaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 14),
                  ),
                  Text(
                    'EGP ${args.price}',
                    style: TextStyle(
                      color: ThemeManager.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              10.verticalSpace,
              Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: 110.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 1, color: const Color(0xff004182))),
                    child: Text(
                      "${args.sold} sold",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: ThemeManager.primaryColor,
                      ),
                    ),
                  ),
                  20.horizontalSpace,
                  const Icon(Icons.star, color: Color(0xfffdd835)),
                  Text(
                    "${args.ratingsAverage.toString()} (${args.quantity})",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: ThemeManager.primaryColor,
                        fontSize: 14),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    width: 122.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                      color: ThemeManager.primaryColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IncrementOrDecrementComponent(
                          path:
                              'assets/icon/🦆 icon _subtract circle minus remove_.png',
                          onTap: () {
                            if (widget.text >= 2) {
                              widget.text--;
                            }
                            setState(() {});
                          },
                        ),
                        3.horizontalSpace,
                        Text(
                          widget.text.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        IncrementOrDecrementComponent(
                          path: 'assets/icon/🦆 icon _plus circle_.png',
                          onTap: () {
                            widget.text++;

                            setState(() {});
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
              10.verticalSpace,
              Text(
                'Description',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ThemeManager.primaryColor),
              ),
              ReadMoreText(
                args.description ?? '',
                trimLines: 3,
                trimMode: TrimMode.Line,
                trimCollapsedText: "Read more",
                trimExpandedText: " .... Show Less",
                moreStyle: TextStyle(color: ThemeManager.primaryColor),
                lessStyle: TextStyle(color: ThemeManager.primaryColor),
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff06004f)),
              ),
              150.verticalSpace,
              ListTile(
                leading: Column(
                  children: [
                    const Text("Total Price",
                        style: TextStyle(
                            color: Color(0xff06004f),
                            fontSize: 18,
                            fontWeight: FontWeight.w300)),
                    Text('EGP (${args.price})',
                        style: TextStyle(
                            color: ThemeManager.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w800)),
                  ],
                ),
                title: Container(
                  alignment: Alignment.center,
                  width: 270.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                      color: ThemeManager.primaryColor,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: InkWell(
                    onTap: () {
                      //todo: add to card
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.shopping_cart_checkout,
                          color: Colors.white,
                        ),
                        Text(
                          "Add to card",
                          style: TextStyle(
                              color: ThemeManager.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
