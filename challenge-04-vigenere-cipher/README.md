## Challenge 04

### Cifra de Vigenère

Cifra de Vigenère é uma criptografia simples usada para embaralhar textos. Valores que não seja letras NÃO SÃO TRANSFORMADOS.

Crie uma classe que execute 3 regras de negócio relacionado a criptografia:
A. Gerador de Key randômica.
B. Encode (Retorne o texto criptografado)
C. Decode (Retorne o texto descriptografado).

_Obs:_ Use apenas valores maiúsculos. Certifique-se disso! 


A. Algorítimo para Key:
Para executar o encode e decode é necessário ter uma chave que tenha valores randômicos mas que tenha a mesma quantidade de caracteres do texto a ser criptografado.

B. Encode:
- Passo 1: Receba o texto a ser criptografado e a chave em questão.
- Passo 2: deve-se somar o charCode de cada letra do texto e da key em suas respectivas posições e dividir por 26. O RESTO dessa divisão deve ser somado com o CharCode da letra A.
- Passo 3: O resultado da soma anterior é o novo char.
Lembre-se: Valores não alfabetos não devem ser transformados.

C. Decode:
- Passo 1: Receba a o texto criptografado e a chave.
- Passo 2: deve-se subtrair o charCode de cada letra do texto e da key em suas respectivas posições somando o resultado com 26. O resultado deve ser dividido por 26. O RESTO dessa divisão deve ser somado com o CharCode da letra A.
- Passo 3: O resultado da soma anterior é o  char descriptografado.

### Validador

https://www.cs.du.edu/~snarayan/crypt/vigenere.html