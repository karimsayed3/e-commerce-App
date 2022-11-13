import 'package:e_commerce/data/product/product_model.dart';
import 'package:e_commerce/presentation/screens/product_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/screens/product_details_screen/product_details_cubit/product_details_cubit.dart';

Widget textWithTextForm({
  required String label,
  required dynamic textInputType,
  dynamic validator,
  required TextEditingController controller,
  bool? obscureText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(color: Colors.grey, fontSize: 14),
      ),
      TextFormField(
        keyboardType: textInputType,
        validator: validator,
        obscureText: obscureText ?? false,
        controller: controller,
        decoration: const InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget productItem(context, List<ProductItemData> item, int length) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 10,
      childAspectRatio: 1 / 2,
      children: List.generate(
        length,
        (index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => ProductDetailsCubit()
                        ..getProductDetails(productId: item[index].id),
                      child: const ProductDetailsScreen(),
                    ),
                  ),
                );
              },
              child: Container(
                width: width * .5,
                height: height * .35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      item[index].image.toString(),
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width * .5,
              child: Text(
                item[index].name!,
                style: TextStyle(
                  fontSize: width * .04,
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            Text(
              '\$' + item[index].price.toString(),
              style: TextStyle(
                color: Color(0xff00c569),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
