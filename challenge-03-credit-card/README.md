## Challenge 03

### Validador de Cartão de Crédito

Faça uma função que receba os números de um cartão de crédito e retorne se o número é válido ou não (Bool).

O Mod 10 é um algoritmo para validação de cartões que é utilizado pela maioria das bandeiras em todo o mundo. A seguir mostro como utilizar o algoritmo para validar a numeração do cartão.
Para validar o cartão de crédito siga esses passos:

1. Separe o último dígito do cartão. Neste caso é o zero.

2. Multiplique a numeração do cartão, número por número sendo a coluna ímpar por 1 e a coluna par por 2, levando em conta que a primeira coluna inicia-se por 0 (zero). Se o valor da multiplicação tiver dois dígitos, separe e some cada unidade.  Em seguida, some todos os valores.

3. Com o resultado anterior, faça uma divisão por 10 para obter o resto da divisão:

4. Subtraia o resto da divisão por 10:

5. Faça a verificação do número que foi separado no item 1 com o resultado do item 4. Se os números forem iguais, o cartão é valido, e se forem diferentes, é invalido.


Para testes, segue dois  números de cartão:

Cartão inválido: 5419 8250 0346 1210.
Cartão válido: 4916 6418 5936 9080.