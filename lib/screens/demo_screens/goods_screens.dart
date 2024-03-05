import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:my_default_project/data/models/network_responce.dart';
import 'package:my_default_project/data/models/product/product.dart';
import 'package:my_default_project/data/repository/product_repository.dart';
import 'package:my_default_project/screens/demo_screens/description_screen.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';

class GoodsScreens extends StatefulWidget {
  const GoodsScreens({super.key});

  @override
  State<GoodsScreens> createState() => _GoodsScreensState();
}

class _GoodsScreensState extends State<GoodsScreens> {
  final ProductRepository productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Goods"),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: AppColors.transparent),
      ),
      body: FutureBuilder(
        future: productRepository.getGoods(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<ProductModel> goods =
                (snapshot.data as NetworkResponse).data as List<ProductModel>;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // Change the number of columns as needed
                        crossAxisSpacing: 10.0,
                        // Set the spacing between columns
                        mainAxisSpacing: 10.0, // Set the spacing between rows
                      ),
                      itemCount: goods.length,
                      itemBuilder: (context, index) {
                        var good = goods[index];
                        return Material(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.c_B7DFF5),
                            child: Column(
                              children: [
                                50.getH(),
                                Expanded(
                                  child: Image.network(
                                    good.imageUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                ListTile(
                                  title: Text(good.productName),
                                  subtitle: Text(good.price.toString()),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsScreens(
                                                      name: goods[index]
                                                          .productName,
                                                      description: goods[index]
                                                          .description,
                                                      img: goods[index]
                                                          .imageUrl),
                                            ),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: AppColors.c_53b175,
                                          foregroundColor: Colors.pink,
                                        ),
                                        child:const Text(
                                          "Details",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: Icon(Icons.edit),
                                      onPressed: () async {
                                        ProductModel productModel =
                                            ProductModel(
                                          color: Colors.red,
                                          description: good.description,
                                          productName: "15 Pro M2",
                                          imageUrl: good.imageUrl,
                                          price: good.price,
                                          dateTime: DateTime.now(),
                                          productId: good.productId,
                                        );

                                        await productRepository
                                            .updateGoods(productModel);
                                        setState(() {});
                                      },
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: Icon(Icons.delete,color: Colors.red,),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Delete Item"),
                                              content: Text(
                                                  "Are you sure you want to delete this item?"),
                                              actions: [
                                                TextButton(
                                                  child: Text("No"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text("Yes"),
                                                  onPressed: () async {
                                                    await productRepository
                                                        .deleteGoods(
                                                            good.productId);
                                                    setState(() {});

                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ProductModel productModel = ProductModel(
            color: Colors.red,
            description: "Apple MacBook Pro is a macOS laptop with a 13.30-inch display that has a resolution of 2560x1600 pixels. It is powered by a Core i5 processor and it comes with 12GB of RAM. The Apple MacBook Pro packs 512GB of SSD storage.",
            productName: "macbook pro",
            imageUrl:
            "https://w7.pngwing.com/pngs/106/747/png-transparent-mac-book-pro-macbook-air-laptop-macbook-pro-13-inch-macbook-pro-touch-bar-netbook-computer-monitor-accessory-laptop-thumbnail.png",
              price: 1500.0,
         dateTime: DateTime.now(),
            productId: "",
          );

          await productRepository.addGoods(productModel);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
