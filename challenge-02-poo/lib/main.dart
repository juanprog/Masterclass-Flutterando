import 'cpf.dart';

void main() {
  final cpf = CPF(cpf: '280.012.389-38');

  final isValidCpf = cpf.validate();

  if (isValidCpf) {
    print('CPF válido!');
  } else {
    print('CPF inválido!');
  }

  print(cpf.value);
}
