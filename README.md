## 日本酒銘柄画像検索用リポジトリ

[日本酒銘柄画像検索用データセット](https://competition.nishika.com/competitions/sake/summary)挑戦用リポジトリ


## 環境構築

```bash
docker compose up
```

バックグラウンドで起動する場合
```bash
docker compose up -d
```

Dockerfile などを修正し，再度コンテナをビルドする場合
```bash
docker compose up --build -d
```

特定のファイルしてしてビルドする場合
```bash
docker compose up -f [ファイル名] --build -d
```

## 実験実施
コマンドを叩くためにDocker コンテナに入る方法
```bash
docker compose exec -it [コンテナ名] /bin/bash
```

## poetryの使い方
ライブラリの追加
```bash
poetry add [ライブラリ]
```

開発環境でのみ必要なライブラリ(フォーマッタなど)
```bash
poetry add -D [ライブラリ]
```

コマンドの実行
`poetry run`を付与する必要がある
```bash
poetry run python sample.py
```