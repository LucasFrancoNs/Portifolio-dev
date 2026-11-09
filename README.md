# Portfólio Dev

Portfólio pessoal de desenvolvedor, feito em **Flutter** e **Dart**, com
Material 3, tema escuro/claro e layout adaptativo (celular, tablet e desktop).

## Telas

- **Perfil**: cabeçalho com avatar e ações (e-mail e GitHub), sobre,
  habilidades agrupadas por categoria e contato.
- **Projetos**: métricas em cards com selos de destaque e lista de projetos.

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

Todo o conteúdo fica em um único arquivo: [`lib/data/portfolio_data.dart`](lib/data/portfolio_data.dart).
Edite nome, cargo, bio, contato, habilidades, métricas e projetos; a interface
se adapta sozinha. Para adicionar um projeto, basta incluir um item em
`PortfolioData.projects`.

As cores de marca ficam em `lib/core/theme/app_colors.dart`.

## Estrutura

```
lib/
├── main.dart                  # ponto de entrada
├── app.dart                   # MaterialApp, temas e alternância claro/escuro
├── core/
│   ├── responsive/            # pontos de quebra do layout
│   ├── theme/                 # cores, espaçamentos, tema Material 3, gradientes
│   └── utils/                 # abrir links e copiar texto
├── data/                      # conteúdo do portfólio (fonte única)
├── models/                    # modelos imutáveis (perfil, skill, métrica, projeto)
├── shared/widgets/            # componentes reutilizáveis
└── features/
    ├── shell/                 # navegação adaptativa (barra inferior / rail)
    ├── profile/               # tela de perfil e seus widgets
    └── projects/              # tela de projetos e seus widgets
test/
└── widget_test.dart           # testes de widget
```

## Decisões de arquitetura

- **Conteúdo separado da interface**: modelos imutáveis e dados em um só lugar.
- **Organização por feature**, com widgets compartilhados em `shared/`.
- **Tema centralizado** (`ThemeData`, `ThemeExtension` para gradientes) e escala
  de espaçamentos/raios, sem números mágicos espalhados.
- **Layout adaptativo**: `NavigationBar` em telas estreitas e `NavigationRail`
  em telas largas; grades que calculam colunas pela largura disponível.
- **Lints rigorosos** (`strict-casts`, `strict-inference`, imports de pacote).
- **Sem gerenciador de estado externo**: o único estado (tema e aba atual) é
  local, então `setState` basta.
