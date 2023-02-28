/// Calcula o valor da variável passada como null pelo método da regra de três.
/// Devem ser informados dois pares de números [g11] e [g12], [g21] e [g22], onde 
/// apenas uma variável pode ser nula. Caso contrário será retornado -1 para indicar erro.
double? calculateRuleOfThree({double? g11, double? g12, double? g21, double? g22}) {
  final hasOnlyOneNullValue = [g11, g12, g21, g22].where((e) => e == null).length == 1;
  final isElemmentNullInFirstPart = [g11, g22].where((e) => e == null).length == 1;

  if (!hasOnlyOneNullValue) return null;

  if (isElemmentNullInFirstPart) {
    return (g21! * g12!) / (g11 ?? g22!);
  } else {
    return (g11! * g22!) / (g12 ?? g21!);
  }
}
