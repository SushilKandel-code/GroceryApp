import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlinemarket/ApiService/ApiServices.dart';
import 'package:onlinemarket/ModelClass/categoryProduct_Models.dart';
import 'package:onlinemarket/elements/constant.dart';
import 'package:onlinemarket/elements/drawer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool? isLoading = true;
  final _categoryService = CategoryApiService();

  CategoryProductModel? categoryProductModel;

  @override
  void initState() {
    super.initState();
    _categoryService.getCategories().then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> _pullRefresh() async {
    setState(() {
      isLoading = true;
      _categoryService.getCategories();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(screenBackgroundColor),
        appBar: _appBarComponent() as PreferredSizeWidget?,
        drawer: DrawerComponent(),
        body: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: InkWell(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
              ),
              padding: EdgeInsets.all(
                10.0,
              ),
              itemCount: _categoryService.category!.contents!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return _categoryContent(
                  imagePath:
                      "http://gstore.ksushil.com.np/images/${_categoryService.category!.contents![index].imagePath}",
                  name: _categoryService.category!.contents![index].name,
                )!;
              },
            ),
            onTap: () {
              int index = 0;
              //  Navigator.pushNamed(context, '/productList',
              //     arguments: categoryProductModel!.content![index].id);

              print(_categoryService.category!.contents![index].name);
            },
          ),
        ),
      ),
    );
  }

  Widget _appBarComponent() {
    return AppBar(
      backgroundColor: appBarColor,
      elevation: 1.0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 20.0,
          ),
          onPressed: () {},
        )
      ],
      title: Text(
        'Category',
      ),
    );
  }

  Widget? _categoryContent({
    @required String? name,
    @required String? imagePath,
  }) {
    return Container(
      height: 250.0,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name!,
              style: GoogleFonts.poppins(fontSize: 15.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Image.network(
                imagePath!,
                fit: BoxFit.fill,
                height: 100.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
