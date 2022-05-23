# Flutter Classroom

## Documentação:

- API da aplicação: [European Central Bank](https://www.frankfurter.app/docs/#currencies).
- Interface de inspiração da aplicação: [XE Currency Converter](https://www.xe.com/currencyconverter/).
- Editor de Markdown (Editor desse documento): [Dillinger](https://dillinger.io/)
- Aulas gravadas no Teams: [Sharepoint](https://extremedigital.sharepoint.com/:f:/s/LABInivaesEDS/Ei4zsMIEHF1Pk5yvAWhYmsEBTl3Ifrde4-fUrScIN8Oyig?e=2vzrNv)

## Referências:

- Boas práticas de codificação: [Effective Dart](https://dart.dev/guides/language/effective-dart/usage)

## Comandos úteis:

Gerar as classes Mocks do Mockito:

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

Executar os testes com coverage e converter para HTML:

```sh
flutter test --coverage && genhtml coverage/lcov.info --output=coverage
```
