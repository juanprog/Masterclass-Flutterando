/// Realiza o cálculo do IMC o [peso] pela [altura] ao quadrado.
/// 
/// Retorna o valor [double] obtido.
double calculateIMC({
  required double peso,
  required double altura,
}) {
  return peso / (altura * altura);
}