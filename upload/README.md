# reactアプリケーション設定

## react app テンプレート作成

```% npx create-react-app upload --template typescript```

## axios インストール

```% npm install axios```

## ファイルコピー

以下のファイルをここからダウンロード（またはgit clone）し、上で作成したテンプレートディレクトリにコピーする

- src

  App.tsx

  serverconfig.json
   
## serverconfig.jsonの調整

### MacOS（BrewでインストールしたApache）の場合

 - IRISサーバーのIPアドレス、ポート番号を反映
 - (IPアドレス = localhost IPポート番号: 8080)
 - Webアプリケーション名
 - （デフォルト　/api/upload）

### Windows（IIS）の場合

 - IRISサーバーのIPアドレス、ポート番号を反映
 - (IPアドレス = localhost IPポート番号: 80)
 - Webアプリケーション名
 - （デフォルト　/iris/api/upload）

### Private Web Serverの場合

 - IRISサーバーのIPアドレス、ポート番号を反映
 - (IPアドレス = localhost IPポート番号: 52773)
 - Webアプリケーション名
 - （デフォルト　/api/upload）

## reactアプリケーションの起動

- npm start

    Starts the development server.

- npm run build

    Bundles the app into static files for production.

- npm test

    Starts the test runner.

- npm run eject

    Removes this tool and copies build dependencies, configuration files
    and scripts into the app directory. If you do this, you can’t go back!

## http.confの修正（以下の行を追加）

CORSの設定が必要

macOSの場合

```
/opt/homebrew/etc/httpd
```

```
<IfModule mod_headers>
    Header set Access-Control-Allow-Origin "*"
    Header set Access-Control-Allow-Methods "GET,POST,PUT,DELETE,OPTIONS, PATCH"
    Header set Access-Control-Allow-Headers "Content-Type,Authorization,X-Requested-With"
    Header set Access-Control-Allow-Credentials "true"
</IfModule>
```

IISの場合は、デフォルト設定でOK

# IRIS設定


## ローカルセットアップ

```
>set file = "c:\git\upload\src\SetUp.cls"
>write $system.OBJ.Load(file,"ck")
>set dir = "c:\git\upload\src"
>write ##class(TEST.Setup).SetupLocal(dir)
```

