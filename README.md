Ez a projekt egy egyszerű „Hello World” jellegű Node.js + Express alkalmazás, amely bemutatja az alapvető DevOps lépéseket: kódkészítés, verziókövetés trunk-based módszerrel, buildelés, konténerizálás, valamint Terraformmal definiált felhős infrastruktúra létrehozása Azure környezetben.
## 1. Projekt felépítése

A projekt egy egyszerű HTTP szervert tartalmaz, amely a következő címen érhető el futtatás után:
`http://localhost:8080`

A szerver Hello DevOps World! szöveget ad vissza.

## 2. Build lépések (Node.js)

A projekt futtatásához szükség van Node.js-re és npm-re.

Telepítés és indítás:
`npm install`
`npm start`
Ez elindítja az alkalmazást a 8080-as porton.

## 3. Futási lépések (lokálisan)

Projekt mappa:

O:\DevOpsProject\hellodevops


Indítás:

`npm start`

Elérés böngészőben:

`http://localhost:8080`

## 4. Docker build és futtatás

A Dockerfile segítségével konténerizálva is futtatható az alkalmazás.

Docker image buildelése

(ahogy ténylegesen csináltuk)

`docker build --no-cache -t hellodevops:latest . `

Konténer futtatása
`docker run -p 8080:8080 hellodevops:latest`


Böngészőben megnyitva:

`http://localhost:8080`

Konténer belsejének ellenőrzése (pl. package.json)

Git Bash esetén:

`winpty docker run --rm -it hellodevops:latest cat package.json`

## 5. Git workflow – Trunk Based Development

A projekt verziókezelése trunk-based módszerrel történt.

Fő lépések:

A main branch a trunk.

Új funkciókat külön feature branchekben készítünk.

A változtatások után pull request vagy merge vissza main-be.

Használt parancsok:

Repo inicializálás:

`git init`
`git add .`
`git commit -m "Initial commit: Hello DevOps server"`


Feature branch készítése:

`git checkout -b feature/update-message`


Változtatások commitolása:

`git add .`
`git commit -m "feat: update message from feature branch"`


Visszamerge a main branchbe (GitHub vagy GitHub Desktop segítségével)
→ „Merge into main”


## 6. Terraform – Azure Infrastruktúra

A projekt tartalmaz egy terraform/ könyvtárat, amely Azure erőforrások létrehozását definiálja Terraform segítségével.
Ez a konfiguráció egy működőképes, felhős célkörnyezetet ír le, ahol a Node.js alkalmazás Docker image-e futtatható lenne.

Provider

A konfiguráció a következő Terraform providereket használja:

`hashicorp/azurerm   – Azure erőforrások kezelésére`
`hashicorp/random    – DNS név suffix generálásához`

Létrejövő erőforrások

A Terraform kód az alábbi Azure elemeket hozza létre:

Resource Group (devops-rg)

Azure Container Instance (hellodevops-container)

Linux alapú konténer

CPU és memória beállítás

8080-as port megnyitása

Publikus IP cím

Automatikusan generált DNS név (hellodevops-XXXXX.westeurope.azurecontainer.io)

Ez az infrastruktúra teljes mértékben alkalmas lenne a projekt Docker image-ének futtatására.

Terraform használata
`cd terraform`
`terraform init`
`terraform plan`
`terraform apply`


init – letölti a providereket

plan – megmutatja, milyen Azure erőforrások jönnének létre

apply – opcionális; létrehozza a valós felhőben az infrastruktúrát


## 7. Felhasznált technológiák / eszközök

Node.js + Express – alkalmazás

Git + GitHub – verziókövetés (trunk-based)

VS Code – fejlesztői környezet

Docker Desktop (Hyper-V backend) – konténerizálás

Terraform – infrastruktúra mint kód

Azure Container Instances – cél felhőkörnyezet

## 8. Projekt mappa struktúra
```
hellodevops/
├── index.js
├── package.json
├── Dockerfile
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── README.md
```
