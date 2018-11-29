import 'dart:collection';
import 'dart:math';
import 'dart:ui';

import 'package:flutter_app_demo/model/models.dart';

class BagService {

  final List<BagItemModel> _items = [];

  int get itemCount => _items.fold(0, (sum, el) => sum + el.count);

  UnmodifiableListView<BagItemModel> get items => UnmodifiableListView(_items);

  Set<VoidCallback> _listeners = Set();

  void addListener(VoidCallback listener) => _listeners.add(listener);

  void add(ProductModel product, [int count = 1]) {
    _updateCount(product, count);
  }

  void remove(ProductModel product, [int count = -1]) {
    _updateCount(product, count);
  }

  void _updateCount(ProductModel product, int difference) {
    if (difference == 0) return;
    for (int i = 0; i < _items.length; i++) {
      final item = _items[i];
      if (product == item.product) {
        final newCount = item.count + difference;
        if (newCount <= 0) {
          _items.removeAt(i);
          _notifyListeners();
          return;
        }
        _items[i] = BagItemModel(product: item.product, count: newCount);
        _notifyListeners();
        return;
      }
    }
    if (difference < 0) return;
    _items.add(BagItemModel(product: product, count: max(difference, 0)));
    _notifyListeners();
  }



  void _notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

}