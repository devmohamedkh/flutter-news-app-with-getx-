import 'package:get/get.dart';
import 'package:news/Controllers/news_controller.dart';
import 'package:news/Controllers/search_controller.dart';
import 'package:news/utils/service/news_api.dart';

class NewsBindind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsController());
    Get.lazyPut(() => NewsServis());
    Get.lazyPut<SearchController>(() => SearchController());
  }
}
