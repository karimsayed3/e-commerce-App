import 'package:e_commerce/data/product/product_model.dart';
import 'package:flutter/material.dart';

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


Widget productItem(context,List<ProductItemData> item,int length){
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
      childAspectRatio: 1 / 1.9,
      children: List.generate(
        length,
            (index) => Column(
          children: [
            Container(
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
          ],
        ),
      ),
    ),
  );
}