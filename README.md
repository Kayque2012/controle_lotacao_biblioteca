# Controle de Lotação - Biblioteca FIAP

Aplicativo Flutter desenvolvido para o Checkpoint 01 de Mobile Application Development.

## Integrante

- Kayque Duarte Rodrigues

## Funcionalidades

- Capacidade máxima de 50 pessoas.
- Contador de pessoas no local.
- Botoes `Entrou` e `Saiu`.
- Bloqueio de entrada quando a biblioteca esta lotada.
- Bloqueio de saída quando o contador está zerado.
- Mensagens `Pode entrar`, `Atenção: ambiente quase cheio` e `Ambiente lotado`.
- Barra visual de ocupação e avisos ao atingir os limites.
- Imagem local configurada como asset.
- Layout responsivo com rolagem para telas menores.

## Desafio extra

A classe `Ambiente` possui atributos, construtor nomeado `Ambiente.biblioteca`, getters, setter e os metodos `entrar()` e `sair()`.

## Estrutura

```text
lib/
  main.dart
  models/
    ambiente.dart
  pages/
    controle_lotacao_page.dart
assets/
  images/
    biblioteca.png
test/
  ambiente_test.dart
```

## Como executar

1. Tenha o Flutter instalado e configurado.
2. Abra esta pasta no VS Code ou Android Studio.
3. Na primeira abertura, execute `flutter create .` para gerar as pastas nativas do seu sistema.
4. Execute `flutter pub get`.
5. Inicie um emulador ou conecte um celular.
6. Execute `flutter run`.

## Criterios atendidos

O projeto utiliza `Scaffold`, `Container`, `Column`, `Row`, `Text`, `TextButton`, `TextButton.styleFrom` e um asset relacionado ao ambiente escolhido.
