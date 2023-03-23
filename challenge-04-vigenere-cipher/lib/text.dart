/// Classe responsável por tratar o texto inicial que se deseja codificar.

class Text {
  final String value;

  /// Na construção do objeto transforma o [value] para caixa alta, garantindo que
  /// todas as letras serão maiúsculas
  Text(String value) : value = value.toUpperCase();

  /// Retorna a quantidade de caracteres válidos (letras maiúsculas) que o texto possui
  int get validLength => value.replaceAll(RegExp(r'[^A-Z]'), '').length;

  @override
  String toString() => value;
}
