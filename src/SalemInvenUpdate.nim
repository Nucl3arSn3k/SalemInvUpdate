import nimquery
from htmlparser import parseHtml
import std/httpclient
import std/xmltree
import std/openssl
import std/strutils

proc scrape(): string =
  var client = newHttpClient()
  var save: string
  try:
    save = client.getContent("https://salemtechsperts.com/collections/laptops-for-sale")
  finally:
    client.close()
  return save

proc extractProductInfo(xml: XmlNode) =
  # Get all product cards
  let products = xml.querySelectorAll(".card-wrapper")
  
  for product in products: #tweak later
    # Get product name
    let nameElement = product.querySelector(".card__heading a")
    let name = if nameElement != nil: nameElement.innerText.strip() else: "Unknown"
    
    # Get price
    let priceElement = product.querySelector(".price-item--regular")
    let price = if priceElement != nil: priceElement.innerText.strip() else: "N/A"
    
    # Get badge (sold out status)
    let badgeElement = product.querySelector(".badge--bottom-left")
    let badge = if badgeElement != nil: badgeElement.innerText.strip() else: "In Stock"
    
    # Print product information
    echo "Product: ", name
    echo "Price: ", price
    echo "Status: ", badge
    echo "------------------------"

proc main() =
  echo "Fetching product information..."
  let html = scrape()
  let xml = parseHtml(html)
  extractProductInfo(xml)

when isMainModule:
  main()
