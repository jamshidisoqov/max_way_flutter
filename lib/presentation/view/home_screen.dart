import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:max_way_flutter/core/base/view/typography.dart';
import 'package:max_way_flutter/di/database_module.dart';
import 'package:max_way_flutter/domain/models/base_model.dart';
import 'package:max_way_flutter/domain/models/category_data.dart';
import 'package:max_way_flutter/domain/models/product_data.dart';
import 'package:max_way_flutter/domain/repository/max_way_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryData> list = [];
  List<BaseModel> baseModel = [];

  @override
  void initState() {
    super.initState();
    loadCategoryData();
    loadBaseData();
  }

  Future loadCategoryData() async {
    var repo = getIt.get<MaxWayRepository>();
    var result = await repo.getAllCategoriesAndProducts();
    result
        .onSuccess((allList) {
          list = allList
              .map(
                (e) => CategoryData(
                  id: e.id ?? "",
                  title: e.title?.uz ?? "",
                  isSelected: false,
                ),
              )
              .toList();
        })
        .onMessage((message) {})
        .onError((error) {});

    setState(() {});
  }

  Future loadBaseData() async {
    var repo = getIt.get<MaxWayRepository>();
    var result = await repo.getAllCategoriesAndProducts();
    result.onSuccess((p0) {
      for (var value in p0) {
        baseModel.add(CategoryData(
            id: value.id!, title: value.title!.uz!, isSelected: false));
        var list = value.products!
            .map((e) => ProductData(products: e, count: 0, categoryId: ""))
            .toList();
        baseModel.add(Product(list));
      }
      setState(() {});
    }).onMessage((p0) {});
  }

  void updateList(CategoryData categoryData) {
    int index = list.indexWhere((element) => element.id == categoryData.id);
    if (index > -1) {
      list[index] = CategoryData(
          id: categoryData.id,
          title: categoryData.title,
          isSelected: !categoryData.isSelected);



      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Max way",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFFF8F6FA),
            body: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          color: Colors.black12,
                          blurRadius: 5)
                    ],
                  ),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: const BoxDecoration(
                        color: Color(0xFFF8F6FA),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(CupertinoIcons.search),
                            hintText: "Search",
                            border: InputBorder.none,
                            hintStyle: AppTypography.hintStyle),
                        cursorColor: Color(0xFF51267D),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 44,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 4.0),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      itemBuilder: (_, index) {
                        return categoryItem(
                          categoryData: list[index],
                          onTab: (p0) {
                            updateList(p0);
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: baseModel.length,
                        itemBuilder: (context, index) {
                          BaseModel model = baseModel[index];
                          if (model is CategoryData) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              child: Positioned(
                                left: 1,
                                child: Text(
                                  (model).title,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          } else if (model is Product) {
                            return GridView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 2 / 3,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8),
                              children: List.generate(
                                model.list.length,
                                (index) {
                                  return productsItem(
                                    productData: model.list[index],
                                    onTab: (p0) {},
                                  );
                                },
                              ),
                            );
                          }
                          return null;
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget categoryItem(
    {required CategoryData categoryData,
    required Function(CategoryData) onTab}) {
  return SizedBox(
    height: 36,
    child: GestureDetector(
      onTap: () {
        onTab(categoryData);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Color(categoryData.isSelected ? 0xFF51267D : 0xFFFFFFFF),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            categoryData.title,
            style: TextStyle(
                color:
                    Color(categoryData.isSelected ? 0xFFFFFFFF : 0xFF51267D)),
          ),
        ),
      ),
    ),
  );
}

Widget productsItem(
    {required ProductData productData, required Function(ProductData) onTab}) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  "https://cdn.delever.uz/delever/${productData.products.image}",
              progressIndicatorBuilder: (context, url, progress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              errorWidget: (context, url, error) {
                return const Center(
                  child: Icon(CupertinoIcons.antenna_radiowaves_left_right),
                );
              },
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productData.products.title?.uz ?? "Burger",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFE7E9E8),
                  ),
                  child: Center(
                    child: Text(
                      "${productData.products.outPrice} ${productData.products.currency!.toLowerCase()}",
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
