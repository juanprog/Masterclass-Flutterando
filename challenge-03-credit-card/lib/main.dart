import 'package:challenge_03_cartao_credito/cartao_credito.dart';

void main() {
  final cartaoValido = CartaoCredito('4916641859369080');
  final cartaoInvalido = CartaoCredito('5419 8250 0346 1210');

  for (var cartao in [cartaoValido, cartaoInvalido]) {
    if (cartao.isValid()) {
      print('O cartão <${cartao.value}> é VÁLIDO!');
    } else {
      print('O cartão <${cartao.value}> é INVÁLIDO!');
    }
  }
}
