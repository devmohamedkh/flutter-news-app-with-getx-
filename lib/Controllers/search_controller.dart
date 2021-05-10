import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/models/articl_model.dart';
import 'package:news/utils/service/news_api.dart';

class SearchController extends GetxController {
  RxList<Article> serchResalt = RxList();

  ValueNotifier<bool> isloding = ValueNotifier(false);
  NewsServis _newsServis = NewsServis();
  NewsServis _newsServisss = NewsServis();
  var searchController = TextEditingController();
  @override
  void onInit() {
    // searchController.addListener(() {});
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        getSearch();
      }
    });
    super.onInit();
  }

  getSearch() async {
    isloding.value = true;
    final result = await _newsServis.getSearch(searchController.text);
    serchResalt = result.obs;
    isloding.value = false;
  }
}
