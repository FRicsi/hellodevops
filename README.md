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


## 6. Terraform infrastruktúra – Azure Resource Group + Container Instance

A projekt tartalmaz egy Terraform konfigurációt is, amely egy egyszerű, felhőben futtatható célkörnyezetet hoz létre.

Létrejövő erőforrások:

Resource Group: `devops-rg`

Container Instance: `hellodevops-container`

Publikus IP + DNS név

Ez egy életképes felhős környezet, ahol a Docker image-ből épülő hello-devops alkalmazás futtatható lenne.

Használat:
```
cd terraform
terraform init
terraform plan
terraform apply
```

Output:

A konfiguráció a konténer publikus DNS címét is kiírja.


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
