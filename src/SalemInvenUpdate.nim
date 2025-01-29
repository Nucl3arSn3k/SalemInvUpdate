import nimquery

import std/httpclient
import std/openssl
proc scrape() =
  var client = newHttpClient()
  try:
    echo client.getContent("https://salemtechsperts.com/collections/laptops-for-sale")
  finally:
    client.close()

proc main() =

  echo "Hello from main"
  scrape()

when isMainModule:
  main()