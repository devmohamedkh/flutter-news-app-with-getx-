import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:news/Controllers/news_controller.dart';
import 'package:news/screens/artical_details/artical_details_screen.dart';
import 'package:news/screens/search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onTap: () => Get.to(SearchScreen()),
            child: Align(
                alignment: Alignment.centerRight, child: Icon(Icons.search))),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              GetBuilder<NewsController>(
                  init: NewsController(),
                  builder: (controller) => controller.isloding.value
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(
                          child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.topHeadline?.length,
                          itemBuilder: (context, index) {
                            final article = controller.topHeadline?[index];
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
                                        Container(
                                          child: Image.network(
                                            article?.urlToImage ??
                                                'https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg',
                                            height: 200,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                          article?.title ?? '',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                          article?.description ?? '',
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 15),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ))),
            ],
          ),
        ),
      ),
    );
  }
}
