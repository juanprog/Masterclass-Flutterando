import 'package:challenge_03_cartao_credito/credit_card.dart';

void main() {
  final validCard = CreditCard('4916641859369080');
  final invalidCard = CreditCard('5419 8250 0346 1210');

  for (var card in [validCard, invalidCard]) {
    final status = card.isValid() ? 'VÁLIDO' : 'INVÁLIDO';

    print('O cartão (${card.value}) é $status!');
  }
}
