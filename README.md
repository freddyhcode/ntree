# ntree

[![Nim](https://img.shields.io/badge/Nim-2.x-blue)](https://nim-lang.org/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)]()

**Version:** 0.1.0  
**Author:** freddyhcode

Una pequeña herramienta CLI nativa para mostrar el árbol de directorios, escrita en Nim.

## Características

- Muestra directorios y archivos en forma de árbol
- Directorios en azul
- Genera archivos Markdown
- Genera diagramas Mermaid

## Instalación

```powershell
nimble buildExe
```

El ejecutable se genera en `bin`.

Agrega `bin` al PATH de Windows para usar `ntree` desde cualquier directorio.

## Uso

| Opción                           | Descripción                     |
| -------------------------------- | ------------------------------- |
| `ntree`                          | Muestra el árbol en la terminal |
| `ntree -md` o `ntree --markdown` | Genera un archivo `.md`         |
| `ntree -mmd` o `ntree --mermaid` | Genera un archivo `.mmd`        |
| `ntree -h` o `ntree --help`      | Muestra la ayuda                |
| `ntree -v` o `ntree --version`   | Muestra la versión y el autor   |

## Ejemplo

```powershell
cd C:\dev\nim\my-project
ntree
```

```text
my-project
├── src
│   ├── main.nim
│   └── core.nim
├── tests
│   └── test_core.nim
├── README.md
└── my-project.nimble
```

## Licencia

MIT
