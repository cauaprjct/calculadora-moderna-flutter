<div align="center">

# 📱 Calculadora Moderna Flutter

### Uma calculadora elegante e funcional com design moderno

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

**Uma calculadora moderna e elegante desenvolvida com Flutter, com suporte a modo claro/escuro e design responsivo.**

[🚀 Demo](#-demo) • [✨ Features](#-features) • [🛠️ Instalação](#️-instalação) • [📱 Screenshots](#-screenshots)

---

</div>

## 🚀 Demo

> **Experimente agora:** [Demo Web](https://cauaprjct.github.io/calculadora-moderna-flutter)

## ✨ Features

### 🧮 **Funcionalidades Principais**
- ✅ **Operações básicas:** Adição, subtração, multiplicação e divisão
- ✅ **Funções especiais:** Porcentagem, mudança de sinal, limpar e retrocesso
- ✅ **Histórico de cálculos:** Visualize operações anteriores
- ✅ **Validação de entrada:** Prevenção de erros matemáticos
- ✅ **Feedback tátil:** Vibração em dispositivos móveis

### 🎨 **Design & UX**
- 🌙 **Modo claro/escuro** com toggle automático
- 📱 **Design responsivo** para diferentes tamanhos de tela
- 🎯 **Interface intuitiva** com botões grandes e acessíveis
- ✨ **Animações suaves** e transições elegantes
- 🎨 **Material Design 3** com cores harmoniosas

### 🚀 **Performance**
- ⚡ **Inicialização rápida** com otimizações de performance
- 📱 **Multiplataforma:** Android, iOS, Web e Desktop
- 🔧 **Código limpo** e bem estruturado
- 🧪 **Testado** em diferentes dispositivos

## 🛠️ Tecnologias Utilizadas

- **Flutter** 3.8.1+ - Framework multiplataforma
- **Dart** 3.8.0+ - Linguagem de programação
- **Material Design 3** - Sistema de design
- **Google Fonts** - Tipografia moderna
- **Provider** - Gerenciamento de estado

## 🚀 Início Rápido

### Pré-requisitos
- Flutter SDK 3.8.1+
- Dart SDK 3.8.0+
- Android Studio / VS Code
- Git

### Instalação

1. **Clone o repositório**
```bash
git clone https://github.com/cauaprjct/calculadora-moderna-flutter.git
cd calculadora-moderna-flutter
```

2. **Instale as dependências**
```bash
flutter pub get
```

3. **Execute o projeto**
```bash
# Para desenvolvimento
flutter run

# Para web
flutter run -d chrome

# Para build de produção
flutter build apk --release
```

## 📱 Screenshots

<div align="center">

### Modo Claro
<img src="screenshots/light_mode.png" alt="Modo Claro" width="300"/>

### Modo Escuro
<img src="screenshots/dark_mode.png" alt="Modo Escuro" width="300"/>

</div>

## 🏗️ Arquitetura

O projeto segue uma arquitetura limpa e organizada:

```
lib/
├── main.dart                 # Ponto de entrada da aplicação
├── models/                   # Modelos de dados
│   └── calculation.dart
├── providers/                # Gerenciamento de estado
│   ├── calculator_provider.dart
│   └── theme_provider.dart
├── screens/                  # Telas da aplicação
│   └── calculator_screen.dart
├── widgets/                  # Widgets reutilizáveis
│   ├── calculator_button.dart
│   ├── display_widget.dart
│   └── theme_toggle.dart
└── utils/                    # Utilitários
    ├── constants.dart
    └── calculator_logic.dart
```

## 🎯 Funcionalidades Detalhadas

### Operações Suportadas
- ➕ **Adição:** Soma de números
- ➖ **Subtração:** Diferença entre números
- ✖️ **Multiplicação:** Produto de números
- ➗ **Divisão:** Quociente de números (com proteção contra divisão por zero)
- 📊 **Porcentagem:** Cálculos percentuais
- 🔄 **Mudança de sinal:** Alternar entre positivo/negativo

### Controles Especiais
- 🗑️ **AC (All Clear):** Limpa toda a operação
- ⬅️ **Backspace:** Remove o último dígito
- 🟰 **Igual:** Executa o cálculo
- 🌙 **Toggle Tema:** Alterna entre modo claro/escuro

## 🧪 Testes

```bash
# Executar todos os testes
flutter test

# Executar testes com coverage
flutter test --coverage

# Testes de widget
flutter test test/widget_test.dart
```

## 🤝 Contribuindo

Contribuições são bem-vindas! Siga estes passos:

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 🙏 Agradecimentos

- [Flutter Team](https://flutter.dev/) pelo framework incrível
- [Material Design](https://material.io/) pelas diretrizes de design
- [Google Fonts](https://fonts.google.com/) pela tipografia

---

<div align="center">

**Desenvolvido com ❤️ por [Cauã](https://github.com/cauaprjct)**

⭐ **Gostou do projeto? Deixe uma estrela!**

</div>