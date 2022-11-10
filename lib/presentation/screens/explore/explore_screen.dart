import 'package:e_commerce/business/home_layout/home_layout_cubit.dart';
import 'package:e_commerce/data/categories/cateory_model.dart';
import 'package:e_commerce/presentation/screens/home_layout_screen/home_layout_screen.dart';
import 'package:e_commerce/presentation/screens/product_screen/get_product_by_id_cubit/get_product_by_id_cubit.dart';
import 'package:e_commerce/presentation/screens/product_screen/product_screen.dart';
import 'package:e_commerce/utils/components.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var cubit = HomeLayoutCubit.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * .1, horizontal: width * .04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createSearchField(controller: searchController),
              SizedBox(
                height: height * .03,
              ),
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
              BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
                builder: (context, state) {
                  var cubit = HomeLayoutCubit.get(context);
                  if (cubit.categoryModel != null) {
                    return SizedBox(
                      height: height * .2,
                      width: width,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return categoryItem(
                              context, cubit.categoryModel!.data!.data![index]);
                        },
                        itemCount: cubit.categoryModel!.data!.total,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              Row(
                children: [
                  const Text(
                    'Best Selling',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, seeAllProductsScreen);
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
              BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
                builder: (context, state) {
                  var cubit = HomeLayoutCubit.get(context);
                  if (cubit.productModel != null) {
                    return productItem(
                        context, cubit.productModel!.data!.data!, 12);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryItem(context, CategoryDataItems item) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => GetProductByIdCubit()..getProductItems(category_id: item.id),
              child: ProductScreen(appBarTitle: item.name!),
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(right: width * .025),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: width * .25,
              height: height * .1,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(item.image!),
                  radius: 25,
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width * .2,
              child: Text(
                item.name!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: width * .03,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createSearchField({
    required TextEditingController controller,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: const Icon(
          Icons.search,
        ),
      ),
      controller: controller,
    );
  }
}
