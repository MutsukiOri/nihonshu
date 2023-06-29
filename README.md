## 日本酒銘柄画像検索用リポジトリ

[日本酒銘柄画像検索](https://competition.nishika.com/competitions/sake/summary)挑戦用リポジトリ


### 環境構築参考
 - [【Docker】GPU が使える Jupyter Notebook 環境を最速で用意する](https://qiita.com/kaijism/items/ada49192df0a6d285c3a)

```sh
 docker run -it --gpus all -v `pwd`/src:/src -p 61109:8888 --name nihonshu nihonshu sh -c 'jupyter-lab --allow-root --ip=*'
```