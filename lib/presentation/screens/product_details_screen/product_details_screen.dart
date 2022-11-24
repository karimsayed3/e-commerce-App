import 'package:e_commerce/business/home_layout/home_layout_cubit.dart';
import 'package:e_commerce/presentation/screens/product_details_screen/product_details_cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var cubit = ProductDetailsCubit.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * .02, vertical: height * .04),
          child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            builder: (context, state) {
              if (cubit.productDetailsModel != null) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      items:
                          cubit.productDetailsModel!.data!.images!.map((image) {
                        return Image(
                          image: NetworkImage(image),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }).toList(),
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        height: 200.0,
                        initialPage: 0,
                        pauseAutoPlayInFiniteScroll: true,
                        reverse: false,
                        autoPlay: false,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    Text(
                      cubit.productDetailsModel!.data!.name!,
                      style: TextStyle(
                        fontSize: width * .05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    Text(
                      'Details',
                      style: TextStyle(
                        fontSize: width * .04,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    Text(
                      cubit.productDetailsModel!.data!.description!,
                      style: TextStyle(
                        fontSize: width * .03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              } else {
                return SizedBox(
                  height: height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70.h,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(offset: Offset(5, 5), blurRadius: 7),
          ]),
          child: Row(
            children: [
              BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                builder: (context, state) {
                  if (cubit.productDetailsModel != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price"),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(cubit.productDetailsModel!.data!.price.toString())
                      ],
                    );
                  }
                  else{
                    return const SizedBox.shrink();
                  }
                },
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: Center(
                    child: Text('ADD'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

// hell
