import std/os

import ntree/core
import ntree/terminal
import ntree/markdown
import ntree/mermaid

const
  AppName = "ntree"
  AppVersion = "0.1.0"
  AppAuthor = "freddyhcode"

proc printVersion() =
  echo AppName, " Version ", AppVersion, " [", hostOS, ": ", hostCPU, "]"
  echo "Compiled at ", CompileDate
  echo "Copyright (c) 2026 ", AppAuthor
  echo ""
  echo "A small native directory tree CLI written in Nim."

proc printHelp() =
  printVersion()
  echo ""
  echo "Usage:"
  echo "  ntree [options]"
  echo ""
  echo "Options:"
  echo "  -md, --markdown           generate Markdown file"
  echo "  -mmd, --mermaid           generate Mermaid diagram"
  echo "  -h, --help                show this help"
  echo "  -v, --version             show version information"

proc printUsage(error: string = "") =
  if error == "":
    echo "Error: too many arguments."
  else:
    echo "Error: unknown option '", error, "'."

  echo ""
  printHelp()

when isMainModule:
  let args = commandLineParams()
  let path = getCurrentDir()

  if args.len > 1:
    printUsage()

  elif args.len == 0:
    let tree = buildTree(path)
    printTree(tree)

  else:
    case args[0]

    of "-h", "--help":
      printHelp()

    of "-v", "--version":
      printVersion()

    of "-md", "--markdown":
      let tree = buildTree(path)
      let directoryName = splitPath(path).tail
      let outputPath = path / (directoryName & ".md")

      writeMarkdown(
        tree,
        outputPath
      )

      echo "Markdown generated: ", outputPath

    of "-mmd", "--mermaid":
      let tree = buildTree(path)
      let directoryName = splitPath(path).tail
      let outputPath = path / (directoryName & ".mmd")

      writeMermaid(
        tree,
        outputPath
      )

      echo "Mermaid generated: ", outputPath

    else:
      printUsage(args[0])