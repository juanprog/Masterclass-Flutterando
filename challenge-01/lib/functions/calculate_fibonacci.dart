/// Calcula a sequência de Fibonacci para o [value] informado.
/// Recebe a lista com a [sequence], inicialmente preenchida com os dois valores
/// iniciais da sequencia.
/// 
/// Retorna uma lista de inteiros com a sequência de Fibonacci.
List<int> calculateFibonacci(int value, List<int> sequence) {
  if (value == 0) return [0];
  if (value == 1 || value == (sequence.length - 1)) return sequence;
  
  sequence.add(
    sequence[sequence.length - 1] + sequence[sequence.length - 2]);
  
  return calculateFibonacci(value, sequence);
}
