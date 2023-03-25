/// Class responsável por gerar a key para o processo de codificação

import 'dart:math';

import 'package:challenge_04_vigenere_cipher/constants.dart';

class Key {
  static final _random = Random();

  /// Realiza a geração da key com o tamanho máximo igual ao [textLength].
  /// Retorna a key gerada.
  static String buildKey({required int textLength}) {
    var key = '';

    final keyLength = _randomKeyLength(textLength);

    for (var i = 0; i < keyLength; i++) {
      key += String.fromCharCode(_randomUpperCaseAlphabetCharCode());
    }

    return _setKeyByTextLength(
      key: key,
      textLength: textLength,
    );
  }

  /// Gera um número aleatório para o tamanho da chave entre 2 e [textLength] (inclusivo)
  static int _randomKeyLength(int textLength) =>
      max(_random.nextInt(textLength + 1), 2);

  /// Gera um valor randômico para o char code do alfabeto maiúsculo
  static int _randomUpperCaseAlphabetCharCode() =>
      Random().nextInt(alphabetLength) + charCodeA;

  /// Define a [key] comparando o seu tamanho com o [textLength], para que a [key]
  /// tenha o mesmo tamanho do texto. Se a chave for menor que o texto, concatena
  /// repetições da chave, e, caso resulte em uma chave maior que o texto, corta.
  static String _setKeyByTextLength({
    required String key,
    required int textLength,
  }) {
    if (key.length == textLength) return key;

    final keyMultplier = _timesToRepeatKey(textLength, key.length);
    
    key = key * keyMultplier;
    
    return key.substring(0, textLength);
  }

  /// Define a quantidade de vezes que a key deve se repetir para cobrir o texto.
  /// Retorna o maior inteiro mais próximo do resultado da divisão entre o
  /// [textLength] e o [keyLength]
  static int _timesToRepeatKey(int textLength, int keyLength) =>
      (textLength / keyLength).ceil();
}
