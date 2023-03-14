import 'package:challenge_03_cartao_credito/credit_card.dart';

void main() {
  final cartaoValido = CreditCard('4916641859369080');
  final cartaoInvalido = CreditCard('5419 8250 0346 1210');

  for (var cartao in [cartaoValido, cartaoInvalido]) {
    if (cartao.isValid()) {
      print('O cartão <${cartao.value}> é VÁLIDO!');
    } else {
      print('O cartão <${cartao.value}> é INVÁLIDO!');
    }
  }
}
