#  Portfólio Dev — Thiago & Lucas

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Material 3](https://img.shields.io/badge/Material%203-Design%20System-757575?style=for-the-badge)

Aplicação de portfólio duplo desenvolvida em **Flutter** e **Dart** com **Material 3**, tema dinâmico por perfil, suporte a modo claro/escuro e layout responsivo que se adapta de dispositivos móveis a telas desktop.

---

##  Perfis & Temas Dinâmicos

O aplicativo conta com navegação por abas onde cada desenvolvedor possui uma identidade visual própria. Ao alternar entre os perfis, toda a paleta da interface (barra de navegação, gradientes, botões, cards e destaques) é recalculada automaticamente via `seedColor`:

| Aba | Desenvolvedor | Foco Principal | Cor Tema | GitHub |
| :--- | :--- | :--- | :---: | :--- |
| **Perfil 1** | **Lucas Novaes** | Flutter, Dart & Back-end (PHP) | 🟢 Verde (`#16A34A`) | [@LucasFrancoNs](https://github.com/LucasFrancoNs) |
| **Perfil 2** | **Thiago Silva Moraes** | Flutter, Dart & Front-end (JS/Web) | 🔴 Roxo (`#DC2626`) | [@Thiago-sm11](https://github.com/Thiago-sm11) |

---

##  Funcionalidades

- **Tema Dinâmico por Perfil:** Geração automática de esquemas de cores Material 3 (`ColorScheme.fromSeed`) com cache e extensões personalizadas (`ThemeExtension`) para gradientes da marca.
- **Modo Claro & Escuro (Light / Dark Mode):** Alternância instantânea de brilho mantendo a identidade cromática do perfil ativo.
- **Layout Adaptativo & Responsivo:**
  - *Mobile:* Navegação via `NavigationBar` inferior.
  - *Tablet / Desktop:* Navegação via `NavigationRail` lateral e grades dinâmicas que ajustam o número de colunas conforme a largura da tela.
- **Vitrine Completa de Perfil:**
  - **Hero Section:** Avatar com gradiente, cargo, localização (Ribeirão Pires, SP) e botões de ação rápida.
  - **Habilidades Categorizadas:** Chips organizados por *Mobile*, *Web*, *Back-end* e *Ferramentas*.
  - **Métricas & Conquistas:** Cards de estatísticas com badges de destaque (`TOP`, `NOVO`).
  - **Projetos:** Cards interativos com tags tecnológicas e links externos via `url_launcher`.
  - **Contato Rápido:** Abertura direta de e-mail/links e opção de copiar informações para a área de transferência.

---

##  Stack & Ferramentas

- **Linguagem:** Dart (`^3.6.0`)
- **Framework:** Flutter (`>=3.27.0`) com Material 3
- **Dependências:** [`url_launcher`](https://pub.dev/packages/url_launcher) (`^6.3.1`)
- **Qualidade de Código:** `flutter_lints` (`^5.0.0`) com tipagem estrita (`strict-casts` e `strict-inference`)

---

##  Estrutura do Projeto

A arquitetura separa a camada de dados dos componentes visuais e organiza a interface por *features*:

```text
lib/
├── main.dart                  # Ponto de entrada da aplicação
├── app.dart                   # Configuração do MaterialApp, controle de aba e tema
├── core/
│   ├── responsive/            # Breakpoints e regras de responsividade
│   ├── theme/                 # Cores, dimensões, gradientes e gerador de tema M3
│   └── utils/                 # Utilitários para abertura de links e cópia de texto
├── data/
│   └── portfolio_data.dart    # Fonte única de dados dos perfis, métricas e projetos
├── models/                    # Modelos imutáveis (DeveloperProfile, Project, Skill, etc.)
├── shared/widgets/            # Componentes reutilizáveis (avatares, badges, grids, headers)
└── features/
    ├── shell/                 # Estrutura de navegação adaptativa (BottomBar / Rail)
    └── profile/               # Tela principal de perfil e seus widgets específicos
test/
└── widget_test.dart           # Testes automatizados de interface e navegação
```

---

##  Como Executar Localmente

### Pré-requisitos
- [Flutter SDK](https://docs.flutter.dev/get-started/install) **3.27.0** ou superior
- Dart SDK **3.6.0** ou superior

### Passo a passo

1. **Clone o repositório:**
   ```bash
   git clone [https://github.com/LucasFrancoNs/Portifolio-dev.git](https://github.com/LucasFrancoNs/Portifolio-dev.git)
   cd Portifolio-dev
   ```

2. **Gere os arquivos de plataforma (caso ainda não existam):**
   ```bash
   flutter create . --platforms=web,android
   ```

3. **Instale as dependências:**
   ```bash
   flutter pub get
   ```

4. **Execute o projeto (ex: navegador Chrome):**
   ```bash
   flutter run -d chrome
   ```

### Testes e Análise Estática

```bash
# Verificar regras de lint e tipagem
flutter analyze

# Executar testes de widget
flutter test
```

---

##  Como Personalizar

Todo o conteúdo exibido no aplicativo está centralizado em **`lib/data/portfolio_data.dart`**:

- **Editar textos, skills ou projetos:** Altere os objetos `lucas` ou `thiago` dentro de `PortfolioData` — a interface se ajusta automaticamente.
- **Mudar a cor de um perfil:** Atualize o parâmetro `seedColor` do perfil desejado.
- **Adicionar um novo desenvolvedor:** Instancie um novo `PortfolioProfile` e adicione-o à lista `PortfolioData.profiles`.

---

##  Autores

- **Thiago Silva Moraes** — [GitHub](https://github.com/Thiago-sm11) • `thiagosilvamoraes@yahoo.com.br`
- **Lucas Novaes** — [GitHub](https://github.com/LucasFrancoNs) • `lucasnovaes479@gmail.com`
