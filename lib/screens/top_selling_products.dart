import 'package:flutter/material.dart';
import 'package:zoonMall/helpers/shimmer_helper.dart';
import 'package:zoonMall/my_theme.dart';
import 'package:zoonMall/repositories/product_repository.dart';
import 'package:zoonMall/ui_elements/product_card.dart';

class TopSellingProducts extends StatefulWidget {
  @override
  _TopSellingProductsState createState() => _TopSellingProductsState();
}

class _TopSellingProductsState extends State<TopSellingProducts> {
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildProductList(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.arrow_back, color: MyTheme.dark_grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: Text(
        "Top Selling Products",
        style: TextStyle(fontSize: 16, color: MyTheme.accent_color),
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  buildProductList(context) {
    return FutureBuilder(
        future: ProductRepository().getBestSellingProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            //snapshot.hasError
            /*print("product error");
            print(snapshot.error.toString());*/
            return Container();
          } else if (snapshot.hasData) {
            var productResponse = snapshot.data;
            return SingleChildScrollView(
              child: GridView.builder(
                // 2
                //addAutomaticKeepAlives: true,
                itemCount: productResponse.products.length,
                controller: _scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.618),
                padding: EdgeInsets.all(16),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // 3
                  return ProductCard(
                    id: productResponse.products[index].id,
                    image: productResponse.products[index].thumbnail_image,
                    name: productResponse.products[index].name,
                    price: productResponse.products[index].base_price,
                  );
                },
              ),
            );
          } else {
            return ShimmerHelper()
                .buildProductGridShimmer(scontroller: _scrollController);
          }
        });
  }
}
