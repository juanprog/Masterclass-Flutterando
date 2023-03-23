/// Classe responsável pela encriptação do texto.

import 'package:challenge_04_vigenere_cipher/constants.dart';

class VigenereCipher {
  /// Interface de acesso para a codificação do [text] utilizando a [key].
  /// Retorna o texto codificado.
  String encode({required String text, required String key}) =>
      _encrypt(text: text, key: key, fnSum: _sumEncode);

  /// Interface de acesso para a decodificação do [text] utilizando a [key].
  /// Retorna o texto decodificado.
  String decode({required String text, required String key}) =>
      _encrypt(text: text, key: key, fnSum: _sumDecode);

  /// Realiza a encriptação (codificação ou decodificação) do [text], utilizando
  /// a [key] e o método de [fnSum] que é definido pelo método que o chama
  /// (codificação ou decodificação).
  /// Retorna o texto encriptado.
  String _encrypt({
    required String text,
    required String key,
    required int Function(int, int) fnSum,
  }) {
    var encryptedText = '';
    var i = 0;

    final keyCharCodes = key.runes.toList();

    for (var textCharCode in text.runes) {
      if (_isCharCodeValid(textCharCode)) {
        final sum = fnSum(textCharCode, keyCharCodes[i++]);

        final rest = sum % alphabetLength;

        final encryptedCharCode = rest + charCodeA;

        encryptedText += String.fromCharCode(encryptedCharCode);
      } else {
        encryptedText += String.fromCharCode(textCharCode);
      }
    }

    return encryptedText;
  }

  /// Retorna true se o [charCode] é uma letra maiúscula, e false caso contrário.
  bool _isCharCodeValid(int charCode) =>
      charCode >= charCodeA && charCode <= charCodeZ;

  /// Soma realizada no processo de codificação.
  int _sumEncode(int textCharCode, int keyCharCode) =>
      textCharCode + keyCharCode;

  /// Soma realizada no processo de decodificação.
  int _sumDecode(int textCharCode, int keyCharCode) =>
      textCharCode - keyCharCode + alphabetLength;
}
