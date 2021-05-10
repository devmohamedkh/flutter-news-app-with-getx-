import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/Controllers/search_controller.dart';
import 'package:news/screens/artical_details/artical_details_screen.dart';

class SearchScreen extends GetWidget<SearchController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          //controller: controller.searchController,
          decoration: InputDecoration(hintText: 'search for news'),
          onChanged: (value) {
            controller.searchController.text = value;
          },
        ),
      ),
      body: Column(
        children: [
          Obx(() {
            return controller.isloding.value
                ? Center(child: CircularProgressIndicator())
                : controller.serchResalt.isEmpty
                    ? Text('')
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.serchResalt.length,
                          itemBuilder: (context, index) {
                            final article = controller.serchResalt[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(ArticaldetailsScreen(
                                          article: article));
                                    },
                                    child: Column(
                                      children: [
                                        SizedBox(height: 15),
                                        Text(
                                          article.title ?? '',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 15),
                                        Container(
                                          child: Image.network(
                                            article.urlToImage ??
                                                'https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg',
                                            height: 200,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
          }),
        ],
      ),
    );
  }
}
