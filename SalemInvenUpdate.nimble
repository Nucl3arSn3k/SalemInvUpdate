# Package
version       = "0.1.0"
author        = "Nucl3arSn3k"
description   = "Webscraper to update me on inventory on the Salem Techsperts site"
license       = "MIT"
srcDir        = "src"
bin           = @["SalemInvenUpdate"]

# Dependencies
requires "nim >= 2.2.0"
requires "nimquery"
requires "httpbeast >= 0.4.0"

# Tasks
task build, "Build the project":
  exec "nim c -d:ssl src/SalemInvenUpdate.nim"

task run, "Build and run the project":
  exec "nim c -d:ssl -r src/SalemInvenUpdate.nim"