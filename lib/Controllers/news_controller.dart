import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news/models/articl_model.dart';
import 'package:news/utils/service/news_api.dart';

class NewsController extends GetxController {
  List<Article>? topHeadline;
  List<Article>? allArtical;
  ValueNotifier<bool> isloding = ValueNotifier(false);
  NewsServis _newsServis = NewsServis();

  @override
  void onInit() {
    getTopHeadline();
    super.onInit();
  }

  getTopHeadline() async {
    isloding.value = true;
    final result = await _newsServis.getTopheadlines();
    topHeadline = result;
    isloding.value = false;
    update();
  }

  getAllArtical() async {
    isloding.value = true;
    final result = await _newsServis.getAllArtical();
    allArtical = result;
    isloding.value = false;
    update();
  }
}
