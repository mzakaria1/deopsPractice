#!/bin/bash


curl -s https://www.kfcpakistan.com | grep -Eoi "\\\&q;([A-Za-z]+[[:space:]]*[A-Za-z]*)\\\&q;}" | cut -c"5-" | cut -d \\ -f 1 | head -n 6 > allchoices.txt


fileNames=()

allchoices='allchoices.txt'
n=0
while read line; do
fileNames[$n]=$line
n=$((n+1))
done < $allchoices

fNames=("${fileNames[@]}")

writeFile(){

    n=0
    prices=()
    while read line; do
    prices[$n]=$line
    n=$((n+1))
    done < "priceTemp.txt"

    fprices=("${prices[@]}")
    i=0
    while read line; do
    if [[ $i -lt 10 ]]; then

        echo "$line ${fprices[$i]}" >> "${fNames[$1]}.txt"
    fi

    i=$((i+1))
    done < "nameTemp.txt"

}

everyday()
{
    # Everyday Value    -->>       KFC Deals 
    data=$(curl -s 'https://api-storefront.azurewebsites.net/products'   -H 'Connection: keep-alive'   -H 'Accept: application/json, text/plain, */*'   -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 OPR/73.0.3856.284'   -H 'Content-Type: application/json; charset=UTF-8'   -H 'Origin: https://www.kfcpakistan.com'   -H 'Sec-Fetch-Site: cross-site'   -H 'Sec-Fetch-Mode: cors'   -H 'Sec-Fetch-Dest: empty'   -H 'Referer: https://www.kfcpakistan.com/collection/everyday-value'   -H 'Accept-Language: en-US,en;q=0.9'   --data-binary '{"storeID":"F1AFD527-3A71-4926-83BE-38288B2E5152","collectionID":"31E5B867-BBC3-4745-A06E-990AF748FC4B","take":12,"skip":0,"orderBy":"price","orderSequence":"ASC","outOfStock":true,"type":[],"vendor":[],"variantFilters":{},"tags":[],"platform":"desktop"}'   --compressed   )   
    name=$(echo $data | grep -o 'productName":"[A-Za-z0-9]*[[:space:]]*[A-Za-z]*' | cut -d \: -f 2 | cut -c"2-" > "nameTemp.txt")
    price=$(echo $data| grep -o 'productPrice":[[:digit:]]*' | cut -d : -f 2 > "priceTemp.txt")

    writeFile 0
}



makeIt(){
    # Make IT A Meal    -->>       

    data=$(curl -s 'https://api-storefront.azurewebsites.net/products' \
    -H 'Connection: keep-alive' \
    -H 'Accept: application/json, text/plain, */*' \
    -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 OPR/73.0.3856.284' \
    -H 'Content-Type: application/json; charset=UTF-8' \
    -H 'Origin: https://www.kfcpakistan.com' \
    -H 'Sec-Fetch-Site: cross-site' \
    -H 'Sec-Fetch-Mode: cors' \
    -H 'Sec-Fetch-Dest: empty' \
    -H 'Referer: https://www.kfcpakistan.com/collection/make-it-a-meal' \
    -H 'Accept-Language: en-US,en;q=0.9' \
    --data-binary '{"storeID":"F1AFD527-3A71-4926-83BE-38288B2E5152","collectionID":"3457DB19-A457-4D85-8A43-01BFFD688814","take":12,"skip":0,"orderBy":"alphabetical","orderSequence":"DESC","outOfStock":true,"type":[],"vendor":[],"variantFilters":{},"tags":[],"platform":"desktop"}' \
    --compressed )
    name=$(echo $data | grep -o 'productName":"[A-Za-z0-9]*[[:space:]]*[A-Za-z]*' | cut -d \: -f 2 | cut -c"2-" > "nameTemp.txt") 
    price=$(echo $data | grep -o 'productPrice":[[:digit:]]*' | cut -d : -f 2 > "priceTemp.txt")

    writeFile 1
    
}

signature(){
    data=$(curl -s 'https://api-storefront.azurewebsites.net/products' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 OPR/73.0.3856.284' \
  -H 'Content-Type: application/json; charset=UTF-8' \
  -H 'Origin: https://www.kfcpakistan.com' \
  -H 'Sec-Fetch-Site: cross-site' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Referer: https://www.kfcpakistan.com/collection/signature-boxes' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --data-binary '{"storeID":"F1AFD527-3A71-4926-83BE-38288B2E5152","collectionID":"F0163E5F-0D44-4553-83F5-D9803CF38EBA","take":12,"skip":0,"orderBy":"price","orderSequence":"ASC","outOfStock":true,"type":[],"vendor":[],"variantFilters":{},"tags":[],"platform":"desktop"}' \
  --compressed )
  
  name=$(echo $data| grep -o 'productName":"[A-Za-z0-9]*[[:space:]]*[A-Za-z]*'| cut -d \: -f 2 | cut -c"2-" > "nameTemp.txt")

  price=$(echo $data | grep -o 'productPrice":[[:digit:]]*' | cut -d : -f 2 > "priceTemp.txt")

  writeFile 2
}



sharing(){
    data=$(curl -s 'https://api-storefront.azurewebsites.net/products' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 OPR/73.0.3856.284' \
  -H 'Content-Type: application/json; charset=UTF-8' \
  -H 'Origin: https://www.kfcpakistan.com' \
  -H 'Sec-Fetch-Site: cross-site' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Referer: https://www.kfcpakistan.com/collection/sharing' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --data-binary '{"storeID":"F1AFD527-3A71-4926-83BE-38288B2E5152","collectionID":"F73E7D3C-9846-46C4-B9B2-23420FB55CE4","take":12,"skip":0,"orderBy":"price","orderSequence":"ASC","outOfStock":true,"type":[],"vendor":[],"variantFilters":{},"tags":[],"platform":"desktop"}' \
  --compressed )
    name=$(echo $data| grep -o 'productName":"[A-Za-z0-9]*[[:space:]]*[A-Za-z]*' | cut -d \: -f 2 | cut -c"2-" > "nameTemp.txt")


  price=$(echo $data| grep -o 'productPrice":[[:digit:]]*' | cut -d : -f 2 > "priceTemp.txt")


  writeFile 3
}


promotions(){
    data=$(curl -s 'https://api-storefront.azurewebsites.net/products' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 OPR/73.0.3856.284' \
  -H 'Content-Type: application/json; charset=UTF-8' \
  -H 'Origin: https://www.kfcpakistan.com' \
  -H 'Sec-Fetch-Site: cross-site' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Referer: https://www.kfcpakistan.com/collection/promotions' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --data-binary '{"storeID":"F1AFD527-3A71-4926-83BE-38288B2E5152","collectionID":"97D12249-0A28-44D2-B5A9-3DC2E0228A7D","take":12,"skip":0,"orderBy":"date","orderSequence":"DESC","outOfStock":true,"type":[],"vendor":[],"variantFilters":{},"tags":[],"platform":"desktop"}' \
  --compressed )
    name=$(echo $data| grep -o 'productName":"[A-Za-z0-9]*[[:space:]]*[A-Za-z]*'| cut -d \: -f 2 | cut -c"2-" > "nameTemp.txt")

  price=$(echo $data| grep -o 'productPrice":[[:digit:]]*' | cut -d : -f 2 > "priceTemp.txt")


  writeFile 4
}


snacks(){
    
    data=$(curl -s 'https://api-storefront.azurewebsites.net/products' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 OPR/73.0.3856.284' \
  -H 'Content-Type: application/json; charset=UTF-8' \
  -H 'Origin: https://www.kfcpakistan.com' \
  -H 'Sec-Fetch-Site: cross-site' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Referer: https://www.kfcpakistan.com/collection/snacks' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --data-binary '{"storeID":"F1AFD527-3A71-4926-83BE-38288B2E5152","collectionID":"B16D1D77-565F-45B6-93C6-109E3F6B8DEF","take":12,"skip":0,"orderBy":"date","orderSequence":"DESC","outOfStock":true,"type":[],"vendor":[],"variantFilters":{},"tags":[],"platform":"desktop"}' \
  --compressed)

   name=$(echo $data | grep -o 'productName":"[A-Za-z0-9]*[[:space:]]*[A-Za-z]*' | cut -d \: -f 2 | cut -c"2-" > "nameTemp.txt")

  price=$(echo $data| grep -o 'productPrice":[[:digit:]]*' | cut -d : -f 2 > "priceTemp.txt")


  writeFile 5

}

midnight() {
   data=$( curl -s 'https://api-storefront.azurewebsites.net/products' \
  -H 'Connection: keep-alive' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36 OPR/73.0.3856.284' \
  -H 'Content-Type: application/json; charset=UTF-8' \
  -H 'Origin: https://www.kfcpakistan.com' \
  -H 'Sec-Fetch-Site: cross-site' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Referer: https://www.kfcpakistan.com/collection/midnight-deals-starts-1200am' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --data-binary '{"storeID":"F1AFD527-3A71-4926-83BE-38288B2E5152","collectionID":"1F4C335B-954D-4CD3-95EF-EE0DFFFD8DA2","take":12,"skip":0,"orderBy":"date","orderSequence":"DESC","outOfStock":true,"type":[],"vendor":[],"variantFilters":{},"tags":[],"platform":"desktop"}' \
  --compressed )

  name=$(echo $data | grep -o 'productName":"[A-Za-z0-9]*[[:space:]]*[A-Za-z]*' | cut -d \: -f 2 | cut -c"2-" > "nameTemp.txt")

  price=$(echo $data| grep -o 'productPrice":[[:digit:]]*' | cut -d : -f 2 > "priceTemp.txt")

  writeFile 6
}



main(){
    everyday
    signature
    sharing
    promotions
    snacks
    midnight

    #Remove Temporary Files
    rm priceTemp.txt
    rm nameTemp.txt   
}

main