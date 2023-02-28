import 'dart:io';

import 'package:challenge_01/functions/calculate_fibonacci.dart';
import 'package:challenge_01/functions/calculate_imc.dart';
import 'package:challenge_01/functions/calculate_rule_three.dart';

void main() {
  String? valueRead;

  double? weight;
  double? height;

  int number = -1;

  stdout.writeln('----------IMC-----------:');

  stdout.writeln('Informe o peso (quilogramas):');
  valueRead = stdin.readLineSync();

  if (valueRead != null) {
    weight = double.tryParse(valueRead);
  }

  stdout.writeln('Informe a altura (metros):');
  valueRead = stdin.readLineSync();

  if (valueRead != null) {
    height = double.tryParse(valueRead);
  }

  if (height != null && weight != null) {
    final imc = calculateIMC(
      peso: weight,
      altura: height,
    ).toStringAsFixed(2);

    stdout.writeln('Valor do IMC: $imc');
  } else {
    stdout.writeln('Valores inválidos!');
  }

  stdout.writeln('------------------------:');

  stdout.writeln('\n-------Fibonacci--------:');

  stdout.writeln('Informe um número: ');
  valueRead = stdin.readLineSync();

  if (valueRead != null) {
    number = int.tryParse(valueRead) ?? number;
  }

  if (number >= 0) {
    String sequence = '';

    for (var i = 0; i <= number; i++) {
      int numFib = calculateFibonacci(i);
      sequence += '$numFib, ';
    }

    stdout.writeln('\nSequência de Fibonacci:');
    stdout.writeln(sequence.substring(0, sequence.length - 2));
  } else {
    stdout.writeln('Valor inválido!');
  }

  stdout.writeln('------------------------:');

  stdout.writeln('\n----Regra de 3--------:');

  double? g11 = 16, g12 = 24, g21 = 10, g22;

  stdout.writeln('g11: $g11, g12: $g12, g21: $g21, g22: $g22');

  final valueRuleOfThree = calculateRuleOfThree(g11: g11, g12: g12, g21: g21, g22: g22);

  if (valueRuleOfThree == null) {
    stdout.writeln('\nInformado valores inválidos!');
  } else {
    stdout.writeln('\nValor obtido da Regra de 3: $valueRuleOfThree');
  }

  stdout.writeln('------------------------:');
}
