import core

proc appendDirectory(
  result: var string,
  node: TreeNode,
  parentId: string,
  counter: var int
) =
  let currentId = "n" & $counter
  inc counter

  result &= "    "
  result &= currentId
  result &= "[\""
  result &= node.name
  result &= "/\"]\n"

  if parentId != "":
    result &= "    "
    result &= parentId
    result &= " --> "
    result &= currentId
    result &= "\n"

  for child in node.children:
    if child.kind == directory:
      appendDirectory(
        result,
        child,
        currentId,
        counter
      )

proc buildMermaid*(
  tree: TreeNode
): string =
  result = "flowchart TD\n"

  var counter = 0

  appendDirectory(
    result,
    tree,
    "",
    counter
  )

proc writeMermaid*(
  tree: TreeNode,
  outputPath: string
) =
  writeFile(
    outputPath,
    buildMermaid(tree)
  )