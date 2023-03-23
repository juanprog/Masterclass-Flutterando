/// Class responsável por gerar a key para o processo de codificação

import 'dart:math';

import 'package:challenge_04_vigenere_cipher/constants.dart';

class Key {
  /// Realiza a geração da key com o tamanho definido em [keyLength].
  /// Retorna a key gerada.
  static String buildKey({required int keyLength}) {
    var key = '';

    for (var i = 0; i < keyLength; i++) {
      key += String.fromCharCode(_randomUpperCaseAlphabetCharCode());
    }

    return key;
  }

  /// Gera um valor randômico para o char code do alfabeto maiúsculo
  static int _randomUpperCaseAlphabetCharCode() =>
      Random().nextInt(alphabetLength) + charCodeA;
}
