import 'package:challenge_04_vigenere_cipher/text.dart';
import 'package:challenge_04_vigenere_cipher/vigenere_cipher.dart';

import 'key.dart';

void main() {
  final text1 = Text('ALGO RITMO');
  final text2 = Text('CRI-PTR0%gr@FIA');

  final vigenereCipher = VigenereCipher();

  for (var text in [text1, text2]) {
    final key = Key.buildKey(keyLength: text.validLength);
    final encodedText = vigenereCipher.encode(text: text.value, key: key);

    final decodedText = vigenereCipher.decode(text: encodedText, key: key);

    print('Texto inicial: $text');
    print('Texto codificado: $encodedText');
    print('Texto decodificado: $decodedText');
    print('Chave: $key');
    print('------------------------------------');
  }
}
