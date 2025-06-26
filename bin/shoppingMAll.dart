import 'dart:io';
import 'product.dart';

class ShoppingMall {
  List<Product> productList = [
    Product('셔츠', 45000),
    Product('원피스', 70000),
    Product('후드', 50000),
    Product('바지', 40000),
    Product('자켓', 80000),
  ];

  int total = 0;
  List<Product> cart = [];

  //판매하는 상품 목록
  void showProducts() {
    for (var p in productList) {
      print('${p.name} / ${p.price} 원');
    }
  }

  //상품을 장바구니에 담는 메서드
  void addToCart() {
    stdout.write('상품 이름을 입력해주세요: ');
    String? name = stdin.readLineSync();
    stdout.write('상품 개수를 입력해주세요: ');
    String? countString = stdin.readLineSync();

    List<String> names = productList.map((p) => p.name).toList();

    if (name == null || name.isEmpty || !names.contains(name)) {
      print('입력값이 올바르지 않아요!');
      return;
    }

    int? count = int.tryParse(countString ?? '');
    if (count == null) {
      print('입력값이 올바르지 않아요!');
      return;
    } else if (count <= 0) {
      print('0개보다 많은 개수의 상품만 담을 수 있어요!');
      return;
    }

    int price = productList.firstWhere((p) => p.name == name).price;
    print('장바구니에 상품이 담겼어요');

    for (int i = 0; i < count; i++) {
      cart.add(Product(name, price));
    }
    total += price * count;
  }

  //장바구니에 담은 상품들의 목록과 총 가격
  void showTotal() {
    List<String> itemNames = cart.map((p) => p.name).toSet().toList();
    String nameList = itemNames.join(',');

    if (cart.isEmpty) {
      print('장바구니에 담긴 상품이 없습니다.');
      stdout.write('장바구니를 초기화 하려면 6번을 누르세요.');
      String? input = stdin.readLineSync()?.trim();
      if (input == '6') {
        cart.clear();
        total = 0;
        print('이미 장바구니가 비어있습니다.');
      }
      return;
    } else {
      print('장바구니에 $nameList가 담겨있네요. 총 [$total]원 입니다!');
      stdout.write('장바구니를 초기화 하려면 6번을 누르세요.');
      String? input = stdin.readLineSync();
      if (input == '6') {
        cart.clear();
        total = 0;
        print('장바구니를 초기화 합니다.');
      }
    }
  }
}
