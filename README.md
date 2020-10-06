# CleanStore

Desenvolvido por João Pedro S. Giarrante

[![IDE](https://img.shields.io/badge/Xcode-11.3-blue.svg)](https://developer.apple.com/xcode/)
[![Language](https://img.shields.io/badge/swift-5-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/iOS-13.3-green.svg)](https://developer.apple.com/ios/)
[![Build Status](https://travis-ci.com/github/jpedrosg/TopSwiftRepositories.svg?branch=master)](https://travis-ci.org/jpedrosg/jpsg.clean_crypto)
[![License](https://img.shields.io/github/license/tiagoco/TopSwiftRepositories.svg)](LICENSE)

# Introdução: 
Aplicativo iOS que tem como objetivo acessar a [CoinApi](https://www.coinapi.io) , e visualizar cotação de Crypto Moedas.


## Screenshots

<img src="https://github.com/jpedrosg/jpsg.clean_crypto/blob/master/firstScreenshot.png?raw=true" height="400" width="200">             <img src="https://github.com/jpedrosg/jpsg.clean_crypto/blob/master/secondScreenshot.png?raw=true" height="400" width="200">        

Print 1 - Consulta de Crypto Moedas. 

Print 2 - Detalhes da Crypto selecionada.


## API
- Consulta de Crypto: https://rest.coinapi.io/v1/exchangerate/BTC/USD


## Ferramentas utilizadas
- Xcode 11.3
- iOS 13.3
- Swift 5
- CocoaPods

## Testes

- Testes unitarios na camada do Interactor (quick e nimble)
- Testes de caixa preta (iOSSnapshotTestCase, KIF)


## Arquitetura utilizada

Neste projeto estou utilizando o Clean Swift.

Mais informações: https://clean-swift.com/clean-swift-ios-architecture/

## Features e diferenciais
- Testes de caixa preta utlizando iOSSnapshotTestCase e o KIF
- Dark Mode

## Próximas adições
- Internacionalização
- 100% Codeview

## Pods utilizados

#### PromiseKit (https://github.com/mxcl/PromiseKit)
Para trabalhar melhor com métodos assíncronos.

#### OHHTTPStubs (https://github.com/AliSoftware/OHHTTPStubs)
Para stubar requisições HTTP no teste integrado.

#### KIF (https://github.com/kif-framework/KIF)
Para teste integrado.

#### iOSSnapshotTestCase (https://github.com/uber/ios-snapshot-test-case)
Para teste de snapshot.

#### Quick (https://github.com/Quick/Quick)
Para testes unitários.

#### Nimble (https://github.com/Quick/Nimble)
Para testes unitários.

## Como compilar

1. Instale o CocoaPods caso não tenha instalado: https://cocoapods.org/
2. Vá até a pasta do projeto pelo terminal (a pasta que tem o arquivo `Podfile`)
3. Digite: `pod install`
4. Pronto. Agora basta abrir o projeto no XCode pelo arquivo **`CleanCrypto.xcworkspace`**

OBS: Não abra pelo **`CleanCrypto.xcodeproj`** pois os pods não serão carregados e dará erro na hora de compilar.

## Instruçōes para compilação dos testes de caixa preta
- Os testes de caixa preta foram configurados apenas no IPod SE (2nd Generation), ao executar os testes certifique-se que o simulador esteja nessa versão do iPhone.
