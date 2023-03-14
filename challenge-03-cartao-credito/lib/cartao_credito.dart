/// Classe de cartão de crédito.
///
/// O atributo [_value] do tipo [String] representa o número do cartão de crédito.
/// O método [isValid] valida se o número do cartão de crédito é válido.

class CartaoCredito {
  final String _value;

  String get value => _value.replaceAllMapped(RegExp(r'(\d{4})(\d{4})(\d{4})(\d{4})'), ((match) {
    const validGroupLengthForCreditCard = 4;

    if (match.groupCount == validGroupLengthForCreditCard) {
      return '${match.group(1)} ${match.group(2)} ${match.group(3)} ${match.group(4)}';
    } else {
      return match.group(0)!;
    }
  }));

  CartaoCredito(String value) : _value = value.replaceAll(RegExp(r'[\D]'), '');

  /// Valida se o número de cartão de crédito informado é válido.
  /// Retorna um [true] caso seja válido e [false] caso contrário.
  bool isValid() {
    int sum = 0;

    if (_value.length != 16) return false;

    for (var i = 0; i < _value.length - 1; i++) {
      final number = int.parse(_value[i]);

      final multiplier = i.isEven ? number * 2 : number;

      sum += multiplier > 9 ? _sumDigitsOfNumber(multiplier) : multiplier;
    }

    final rest = sum % 10;

    final digit = rest == 0 ? 0 : 10 - rest;

    return _isSameDigit(digit);
  }

  /// Soma os dígitos do [number] que possui mais que 1 dígito.
  /// Retorna um [int] do número somado.
  int _sumDigitsOfNumber(int number) {
    return number
        .toString()
        .split('')
        .map((e) => int.parse(e))
        .reduce((value, element) => value + element);
  }

  /// Verifica se o [digit] calculado é igual ao dígito verificador do valor informado.
  /// Retorna um [true] caso seja igual ou [false] caso contrário.
  bool _isSameDigit(int digit) => digit.toString() == _value[_value.length - 1];
}
