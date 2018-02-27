# sampleCMS

## 概要
CMSのサンプルシステムです。

## システム構成

バージョンが書いていないものは最新を使う前提

- Rails 5.1.4
- Ruby 2.5.0
- MYSQL

## 開発環境の構築

開発環境は以下の手順で構築できます。

1. リポジトリをクローン
2. パッケージをインストール
3. database.yml ファイルを変更
4. データベースを作成
5. 初期データを投入

#### 1. リポジトリをクローン

```
$ git clone https://github.com/KeiichiInoue/sampleCMS.git
```

#### 2. パッケージをインストール

一部javascriptは yarn で管理しています。


```
$ bundle install
$ yarn install
```

#### 3. database.yml ファイルを変更

環境に合わせて config/ ディレクトリ配下の dababase.yml を変更します。

ex)

```
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: root
  password: password
  host: localhost

development:
  <<: *default
  database: aws_sns_mysql_development

test:
  <<: *default
  database: aws_sns_mysql_test

```

#### 4. データベースを作成

```
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```

#### 5. 初期データを投入

```
$ bundle exec rake db:seed_fu FIXTURE_PATH=./db/fixtures/development
```

## ログイン

※アカウントは $ rake db:seed_fu 初期データを入れている前提。

id: admin
password: password
