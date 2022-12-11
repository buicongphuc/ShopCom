import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import '../../models/product.dart';
import '../../models/product.dart';

class ProducsManager with ChangeNotifier {
  final List<Product> _item = [
    Product(
      id: 'p1',
      title: 'Cơm gà xối mỡ',
      description: 'Miếng gà giòn tan cùng với cơm được nấu bằng nước mỡ gà cực hấp dẫn',
      price: 30.000,
      imageUrl:
          'https://images.foody.vn/res/g64/630855/prof/s576x330/foody-upload-api-foody-mobile-15-jpg-181026103320.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p2',
      title: 'Cơm sườn cộng',
      description: 'Miếng sườn được tẩm ướp đậm đà gia vị cùng với 1 ít dưa chua giúp quí khách đã ngán',
      price: 35.000,
      imageUrl:
          'https://media.foody.vn/res/g105/1048592/prof/s/foody-upload-api-foody-mobile-ct6-200928163219.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Cơm sườn bì chả',
      description: 'Phần cơm đầy đủ cực kì hấp dẫn với 1 miếng sườn, 1 ít bì, 1 ít chả, cùng 1 ít rau ăn kèm hòa quyện với nước mắm chua ngọt cực kì bắt miệng.',
      price: 45.000,
      imageUrl:
          'https://img-global.cpcdn.com/recipes/a9b651b21ea75cd5/1200x630cq70/photo.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Cơm sườn trứng',
      description: 'bữa ăn cơ bản nhưng lại đầy đủ chất là 1 ít cơm, 1 miếng sườn, 1 quả trứng rán, 1 ít rau.',
      price: 25.000,
      imageUrl:
          'https://img-global.cpcdn.com/recipes/9c904a6b95385e21/400x400cq70/photo.jpg',
      isFavorite: true,
    ),
     Product(
      id: 'p5',
      title: 'Cơm thêm',
      description: 'Cơm trắng thêm',
      price: 3.000,
      imageUrl:
          'https://product.hstatic.net/200000267251/product/sb-081_6285d805217b4ef3b285df2430ae5698_large.png',
    ),
    Product(
      id: 'p6',
      title: 'Trứng thêm',
      description: 'Trứng ốp la',
      price: 5.000,
      imageUrl:
          'https://product.hstatic.net/200000405463/product/m9_trung_op_la__fried_egg________1b207fbb6f4942a896b641491470d581_1024x1024.jpeg',
    ),
    Product(
      id: 'p7',
      title: 'Chả trứng thêm',
      description: 'Chả trứng',
      price: 5.000,
      imageUrl:
          'https://khamphamonngon.com/wp-content/uploads/2016/06/cach-lam-cha-trung-hap.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Bì thêm',
      description: 'Bì',
      price: 5.000,
      imageUrl:
          'https://noiphodien123.vn/wp-content/uploads/2022/05/bi-heo.jpg',
    ),
  ];

  int get itemCount {
    return _item.length;
  }

  List<Product> get items {
    return [..._item];
  }

  List<Product> get favoriteItems {
    return _item.where((item) => item.isFavorite).toList();
  }

  Product? findById(String id) {
    try {
      return _item.firstWhere((item) => item.id == id);
    } catch (error) {
      return null;
    }
  }

  void addProduct(Product product) {
    _item.add(
      product.copyWith(
        id: 'p${DateTime.now().toIso8601String()}',
      ),
    );
    notifyListeners();
  }

  void updateProduct(Product product) {
    final index = _item.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      _item[index] = product;
      notifyListeners();
    }
  }

  void toggleFavoriteStatus(Product product) {
    final savedStatus = product.isFavorite;
    product.isFavorite = !savedStatus;
  }

  void deleteProduct(String id) {
    final index = _item.indexWhere((item) => item.id == id);
    _item.removeAt(index);
    notifyListeners();
  }
}
