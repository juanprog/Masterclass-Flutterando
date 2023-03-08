/// Classe de documento CPF.
///
/// O atributo privado [_cpf] do tipo [String] representa o CPF.
/// O método [validate] valida se o CPF é válido.
/// O método [_calculateDigit] calcula os dígitos verificadores.
class CPF {
  final String _cpf;

  String get value =>
      _cpf.replaceAllMapped(RegExp(r'(\d{3})(\d{3})(\d{3})(\d{2})'), (match) {
        const validGroupLengthForCpf = 4;

        if (match.groupCount == validGroupLengthForCpf) {
          return '${match.group(1)}.${match.group(2)}.${match.group(3)}-${match.group(4)}';
        } else {
          return match.group(0)!;
        }
      });

  CPF({required String cpf}) : _cpf = cpf.replaceAll(RegExp('[\\D]'), '');

  /// Valida se o CPF informado é válido.
  /// Retorna um [true] se for válido e [false] caso contrário.
  bool validate() {
    const validCpfLength = 11;

    if (_cpf.length != validCpfLength) return false;

    final firstPartCpf = _cpf.substring(0, 9);
    final secondPartCpf = _cpf.substring(9, 11);

    final firstDigit = _calculateDigit(partCpf: firstPartCpf).toString();

    final secondDigit =
        _calculateDigit(partCpf: firstPartCpf + firstDigit, isFirstDigit: false)
            .toString();

    return secondPartCpf == (firstDigit + secondDigit);
  }

  /// Calcula os dígitos verificadores do CPF.
  /// Recebe a [partCpf] para cálculo do dígito e a flag [isFirstDigit] para
  /// indicar se é o primeiro ou segundo dígito.
  /// Retorna um inteiro representando o dígito verificador.
  int _calculateDigit({required String partCpf, bool isFirstDigit = true}) {
    int multiplier = 2;
    int sum = 0;
    int maxIndex = isFirstDigit ? 8 : 9;

    for (var i = maxIndex; i >= 0; i--) {
      sum += (int.parse(partCpf[i]) * multiplier++);
    }

    final rest = sum % 11;

    return (rest < 2) ? 0 : (11 - rest);
  }
}
