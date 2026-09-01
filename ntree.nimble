version       = "0.1.0"
author        = "freddyhcode"
description   = "A small native directory tree CLI written in Nim."
license       = "MIT"
srcDir        = "src"
bin           = @["ntree"]
requires      "nim >= 2.0.0"

task buildExe, "Build ntree executable":
  exec "nim c --out:bin/ntree.exe src/ntree.nim"