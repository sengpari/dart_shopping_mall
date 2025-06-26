import 'dart:io';
import 'shoppingMAll.dart';

void main() {
  ShoppingMall mall = ShoppingMall();

  while (true) {
    print(
      '-------------------------------------------------------------------------------',
    );
    print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니 총 가격 보기 / [4] 종료');
    print(
      '-------------------------------------------------------------------------------',
    );
    stdout.write('번호를 입력하세요: ');
    String? input = stdin.readLineSync();
    if (input == '1') {
      mall.showProducts();
    } else if (input == '2') {
      mall.addToCart();
    } else if (input == '3') {
      mall.showTotal();
    } else if (input == '4') {
      stdout.write('정말 종료하시겠습니까? 종료하려면 5를 입력해 주세요');
      String? confirm = stdin.readLineSync();
      if (confirm == '5') {
        print('이용해주셔서 감사합니다~ 안녕히가세요!');
        break;
      } else {
        print('종료하지 않습니다.');
      }
    } else {
      print('지원하지 않는 기능입니다! 다시 시도해주세요');
    }
  }
}
