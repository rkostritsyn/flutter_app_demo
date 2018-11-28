import 'dart:async';

import 'package:flutter_app_demo/model/models.dart';

class ShopCategoryFilters {
  final performSortByPriceFromLowToHeight = StreamTransformer<List<ProductModel>, List<ProductModel>>.fromHandlers(handleData: (list, sink) {
    //TODO: add logic
    list.sort((a,b) => 0);
    sink.add(list);
  });

  final performSortByPriceFromHeightToLow = StreamTransformer<List<ProductModel>, List<ProductModel>>.fromHandlers(handleData: (list, sink) {
  //TODO: add logic
  list.sort((a,b) => 0);
  sink.add(list);
  });

  final performSortByPopularity = StreamTransformer<List<ProductModel>, List<ProductModel>>.fromHandlers(handleData: (list, sink) {
  //TODO: add logic
  list.sort((a,b) => 0);
  sink.add(list);
  });

}