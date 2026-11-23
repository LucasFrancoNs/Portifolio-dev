# Portfólio Dev

Portfólio de desenvolvedor feito em **Flutter** e **Dart**, com Material 3,
tema escuro/claro e layout adaptativo (celular, tablet e desktop).

## Abas

O app tem duas abas, e cada uma é um perfil completo com o próprio tema:

| Aba      | Perfil | Cor do tema |
| -------- | ------ | ----------- |
| Perfil 1 | Lucas  | Verde       |
| Perfil 2 | Thiago | Vermelho    |

Ao trocar de aba, o app inteiro muda de cor: barra de navegação, cabeçalho,
botões, cards e gradientes. Cada perfil tem cabeçalho com avatar e ações
(e-mail e GitHub), sobre, habilidades por categoria, métricas, projetos e
contato.

## Como rodar

Requisitos: Flutter 3.27 ou superior (Dart 3.6+).

```bash
# 1. Gera as pastas de plataforma (web, android, etc.) sem tocar em lib/
flutter create . --platforms=web,android

# 2. Instala as dependências
flutter pub get

# 3. Executa
flutter run -d chrome

# Qualidade
flutter analyze
flutter test
```

## Como personalizar

Todo o conteúdo fica em [`lib/data/portfolio_data.dart`](lib/data/portfolio_data.dart).
Cada `PortfolioProfile` define nome, cargo, bio, contato, habilidades,
métricas, projetos e a cor do tema (`seedColor`).

- **Trocar a cor de um perfil**: altere o `seedColor`. Os gradientes e todo o
  tema são derivados dela.
- **Adicionar uma aba**: crie outro `PortfolioProfile` e inclua em
  `PortfolioData.profiles`. A navegação e o tema se ajustam sozinhos.

## Estrutura

```
lib/
├── main.dart                  # ponto de entrada
├── app.dart                   # MaterialApp, aba ativa e modo claro/escuro
├── core/
│   ├── responsive/            # pontos de quebra do layout
│   ├── theme/                 # tema Material 3 por cor semente, gradientes
│   └── utils/                 # abrir links e copiar texto
├── data/                      # conteúdo do portfólio (fonte única)
├── models/                    # modelos imutáveis (perfil, skill, métrica...)
├── shared/widgets/            # componentes reutilizáveis
└── features/
    ├── shell/                 # navegação adaptativa (barra inferior / rail)
    └── profile/               # página de perfil e seus widgets
test/
└── widget_test.dart           # testes de widget
```

## Decisões de arquitetura

- **Conteúdo separado da interface**: modelos imutáveis e dados em um só lugar.
- **Tema por perfil**: `AppTheme.resolve(seed, brightness)` gera o tema a
  partir da cor do perfil, com cache. Gradientes vão em uma `ThemeExtension`.
- **Organização por feature**, com widgets compartilhados em `shared/`.
- **Layout adaptativo**: `NavigationBar` em telas estreitas e `NavigationRail`
  em telas largas; grades que calculam colunas pela largura disponível.
- **Lints rigorosos** (`strict-casts`, `strict-inference`, imports de pacote).
- **Sem gerenciador de estado externo**: o único estado (aba e tema) é local,
  então `setState` basta.
