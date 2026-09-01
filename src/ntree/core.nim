import std/os
import std/algorithm
import std/strutils

type
  NodeKind* = enum
    directory
    file

  TreeNode* = ref object
    name*: string
    path*: string
    kind*: NodeKind
    children*: seq[TreeNode]

proc newNode*(
  name: string,
  path: string,
  kind: NodeKind
): TreeNode =
  TreeNode(
    name: name,
    path: path,
    kind: kind,
    children: @[]
  )

proc compareNodes(
  a: TreeNode,
  b: TreeNode
): int =
  if a.kind != b.kind:
    if a.kind == directory:
      return -1
    return 1

  cmpIgnoreCase(a.name, b.name)

proc buildTree*(path: string): TreeNode =
  let absolutePath = absolutePath(path)

  result = newNode(
    splitPath(absolutePath).tail,
    absolutePath,
    directory
  )

  for entry in walkDir(absolutePath):
    case entry.kind:
    of pcDir:
      result.children.add(
        buildTree(entry.path)
      )

    of pcFile:
      result.children.add(
        newNode(
          splitPath(entry.path).tail,
          entry.path,
          file
        )
      )

    else:
      discard

  result.children.sort(compareNodes)