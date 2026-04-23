# Work Environment

## Setup script

Use [setup-WSL.sh](https://raw.githubusercontent.com/Relex12/Work-Environment/refs/heads/main/setup-WSL.sh) to setup a consistent WSL working environment

## Common third party tools

- **k9s**: Kubernetes CLI improvement
- **pdb**: Python GDB debugger
- **tig**: Git Terminal User Interface
- **jq**: Json command line parser
- **yq**: YAML command line parser
- **ncdu**: used filesystem space Terminal User Interface
- **uv / poetry**: Python package and dependencies manager
- **nox**: Python automate testing
- **move mouse**: IYKYK

```text
Actions > Distance: 1
Behavior > Automatically stop when user activity detected: True
Behavior > Automatically resume after 30 seconds of inactivity: True
Behavior > Start actions when Move Mouse is launched: True
Appearance > Hide Move Mouse window: True
```

## Useful VS Code shortcuts

|                 |              |                                                                    |
|:---------------:|:------------:|:------------------------------------------------------------------:|
|   select word   |    CTRL+D    |                 select the word at cursor location                 |
|   multicursor   |    CTRL+D    |   select the next occurrence of the selection with a new cursor    |
|   search file   |    CTRL+P    |  look for a file by its name without going through file structure  |
| command palette | CTRL+SHIFT+P |    run vscode or plugins commands, e.g. Transform to Uppercase     |
|   format file   | SHIFT+ALT+F  | format file using the default formatter for the detected file type |
|   close tabe    |    CTRL+W    |                    close the current editor tab                    |
|  open last tab  | CTRL+SHIFT+T |                  open the last editor tab closed                   |
|  autocomplete   |  CTRL+SPACE  |                  open autocompletion suggestions                   |

## VS Code Plugins

### Markdown

- [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint): formatter and linter
- [Markdown Table Prettifier](https://marketplace.visualstudio.com/items?itemName=darkriszty.markdown-table-prettify): table formatter
- [Markdown Preview Enhanced](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced): preview
- [Markmap](https://marketplace.visualstudio.com/items?itemName=gera2ld.markmap-vscode): mind map preview
- [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
- [Markdown Preview Enhanced](https://marketplace.visualstudio.com/items?itemName=shd101wyy.markdown-preview-enhanced)
- [Markdown PDF](https://marketplace.visualstudio.com/items?itemName=yzane.markdown-pdf): export to pdf

### Mermaid

- [Markdown Preview Mermaid Support](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid): mermaid support in markdown preview
- [Mermaid Markdown Syntax Highlighting](https://marketplace.visualstudio.com/items?itemName=bpruitt-goddard.mermaid-markdown-syntax-highlighting): syntax highlight

### Python

- [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance): language support
- [Black Formatter](https://marketplace.visualstudio.com/items?itemName=ms-python.black-formatter): formatter
- [Flake8](https://marketplace.visualstudio.com/items?itemName=ms-python.flake8): linter
- [isort](https://marketplace.visualstudio.com/items?itemName=ms-python.isort): imports orderer
- [Mypy Type Checker](https://marketplace.visualstudio.com/items?itemName=ms-python.mypy-type-checker): type checker

or

- [Ruff](https://marketplace.visualstudio.com/items?itemName=charliermarsh.ruff): all-in-one tool, formatter linter and much more

### C

- [clangd](https://marketplace.visualstudio.com/items?itemName=llvm-vs-code-extensions.vscode-clangd): formatter linter Just-In-Time compiler (to be used with [Bear](https://github.com/rizsotto/Bear))

### Rust

- [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer): language support
- [Rust Syntax](https://marketplace.visualstudio.com/items?itemName=dustypomerleau.rust-syntax): syntax highlight
- [Rust Doc Viewer](https://marketplace.visualstudio.com/items?itemName=JScearcy.rust-doc-viewer): documentation explorer

### TOML

- [Even Better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml): language support and linter

### Jinja

- [Better Jinja](https://marketplace.visualstudio.com/items?itemName=samuelcolvin.jinjahtml): syntax highlight

### CSV

- [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv): syntax highlight
- [Edit CSV](https://marketplace.visualstudio.com/items?itemName=janisdd.vscode-edit-csv): spreadsheet style editor

### Graphviz

- [Graphviz (dot) language support for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=Stephanvs.dot): language support and syntax highlight
- [Graphviz Preview](https://marketplace.visualstudio.com/items?itemName=EFanZh.graphviz-preview): preview

### SQLite

- [SQLite3 Editor](https://marketplace.visualstudio.com/items?itemName=yy0931.vscode-sqlite3-editor): database visualizer and editor

### TODO

- [Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree): TODO and FIXME tracker

### Typo and spell

- [.typo](https://marketplace.visualstudio.com/items?itemName=WombatTechnology.dot-typo): typo corrector
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker): spell checker
- [French - Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker-french)

### PDF

- [vscode-pdf](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf): pdf viewer

### Git

- [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph): git graph viewer and actions
- [GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens): advanced git functionalities

### Github

- [GitHub Pull Requests](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github): review PR directly in VSCode
- [Github Actions](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-github-actions): manage Github workflows

### Formatters

- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode): multi-language formatter
- [Multiple Formatter](https://marketplace.visualstudio.com/items?itemName=Jota0222.multi-formatter): define multiple formatters for a single file type

Multiple formatter: File > Preferences > Settings [...] settings.json

```json
"[markdown]": {
    "editor.defaultFormatter": "Jota0222.multi-formatter",
    "multiFormatter.formatterList": [
        "darkriszty.markdown-table-prettify",
        "DavidAnson.vscode-markdownlint"
    ]
},
```

## Miscellaneous

Clean taskbar on Windows 11: Settings > Customization > Taskbar > Widget : Disabled

Set vim as default Git editor: `git config --global core.editor "vim"`
