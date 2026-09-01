import core

proc appendName(
  result: var string,
  node: TreeNode
) =
  result &= node.name

  if node.kind == directory:
    result &= "/"

proc appendChildren(
  result: var string,
  node: TreeNode,
  prefix: string
) =
  for i, child in node.children:
    let isLast = i == node.children.high

    if isLast:
      result &= prefix
      result &= "└── "

      appendName(
        result,
        child
      )

      result &= "\n"

      if child.kind == directory:
        appendChildren(
          result,
          child,
          prefix & "    "
        )
        
    else:
      result &= prefix
      result &= "├── "

      appendName(
        result,
        child
      )

      result &= "\n"

      if child.kind == directory:
        appendChildren(
          result,
          child,
          prefix & "│   "
        )

proc buildMarkdown*(
  tree: TreeNode
): string =
  result = "# Directory " & tree.name & "\n\n"

  result &= "```text\n"

  appendName(
    result,
    tree
  )

  result &= "\n"

  appendChildren(
    result,
    tree,
    ""
  )

  result &= "```\n"

proc writeMarkdown*(
  tree: TreeNode,
  outputPath: string
) =
  let markdown = buildMarkdown(tree)

  writeFile(
    outputPath,
    markdown
  )