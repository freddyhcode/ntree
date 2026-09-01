import core

const
  Blue = "\e[34m"
  Reset = "\e[0m"

proc printName(
  node: TreeNode
) =
  if node.kind == directory:
    stdout.write(Blue)
    stdout.write(node.name)
    stdout.write("/")
    stdout.write(Reset)
  else:
    stdout.write(node.name)

proc printChildren(
  node: TreeNode,
  prefix = ""
) =
  for i, child in node.children:
    let isLast = i == node.children.high

    if isLast:
      stdout.write(prefix)
      stdout.write("└── ")

      printName(child)

      stdout.write("\n")

      if child.kind == directory:
        printChildren(
          child,
          prefix & "    "
        )

    else:
      stdout.write(prefix)
      stdout.write("├── ")

      printName(child)

      stdout.write("\n")

      if child.kind == directory:
        printChildren(
          child,
          prefix & "│   "
        )

proc printTree*(
  tree: TreeNode
) =
  printName(tree)
  stdout.write("\n")

  printChildren(tree)