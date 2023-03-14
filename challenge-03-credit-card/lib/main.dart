import 'package:challenge_03_cartao_credito/credit_card.dart';

void main() {
  final validCard = CreditCard('4916641859369080');
  final invalidCard = CreditCard('5419 8250 0346 1210');

  for (var card in [validCard, invalidCard]) {
    if (card.isValid()) {
      print('O cartão <${card.value}> é VÁLIDO!');
    } else {
      print('O cartão <${card.value}> é INVÁLIDO!');
    }
  }
}
