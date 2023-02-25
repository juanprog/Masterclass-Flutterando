/// Calcula o número de Fibonacci para o [value] informado.
/// 
/// Retorna o [int] do valor calculado.
int calculateFibonacci(int value) {
  if (value == 0) return 0;
  
  if (value == 1 || value == 2) return 1;

  return calculateFibonacci(value - 1) + calculateFibonacci(value - 2);
}
