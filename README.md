# Live Me
<div align="center">
  <img src="https://user-images.githubusercontent.com/97089962/186897665-e9b2d8b4-a107-4e14-9bfd-a516d5426487.png" width="500x500">
</div>

## サイト概要

### サイトテーマ
`今からライブ行きたい！`　`週末いいライブないかな？`　`バンドを発掘したい！`<br>
と思う方に、直近のライブの情報や、好みに合ったアーティストの提案を行うサイト

### テーマを選んだ理由
音楽が好きで、インディーズで活動しているバンドのライブによく足を運んでいます。<br>

インディーズで活動しているアーティストの音楽を知る方法は、私の経験からいくと<br>
・**`Youtubeでたまたまツボにハマる曲を見つける`**<br>
・**`サブスクの音楽アプリでたまたま見つけてビビッとくる`**<br>
・**`ライブハウスに行った時に目的のアーティストとの対バンで、初めて知ってそこから色々聞いていくうちにハマる`**　　など...<br>
限られた範囲でしか知る事ができませんでした。

`このバンドの良さをみんなに知ってほしい！` `このバンドは生で見るとほんとヤバい！` `あのバンド好きだったら絶対に合う！`　<br>
という願望は、好きなアーティストがいる多くの方々の心の中にあると思っています。<br>
一ファンとしての思いをこのサイトによって叶えたいと思いました。


### ターゲットユーザ
・`ライブに行きたい方`<br>
・`好きなアーティストの良さを広めたい方`<br>
・`自分に合うアーティストを知りたい方`

### 主な利用シーン
・`今からライブに行きたい時`<br>
・`まだ知らないアーティストを発掘したい時`<br>
・`みんなに好きなアーティストの良さを知ってもらいたい時`<br>
・`自分に合うアーティストを知りたい時`<br>

## 設計書
### **ER図**
<div align="center">
  <img src="https://user-images.githubusercontent.com/97089962/185774105-ecace0d6-a33a-4946-8563-1f41865f8950.jpg" width="600x600">
</div>

### **インフラ構成図**
<div align="center">
  <img src="https://user-images.githubusercontent.com/97089962/193170690-766869d5-9c5c-473d-8a73-58ccb7cb5996.jpeg" width="600x600">
</div>



### **テーブル定義書**
[Live-me_テーブル提議書.pdf](https://github.com/yukiya0330/Live_me/files/9388368/Live-me_.2.pdf)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## gems
`gem 'devise'`      => ログイン機能<br>
`gem 'geocoder'`    => GoogleAPI導入時の緯度・経度取得<br>
`gem 'kaminari'`    => ページネーション<br>
`gem 'ransack'`     => 検索機能実装<br>
`gem 'rubocop'`     => コーディングチェック<br>
`gem 'rspec-rails'` => テスト<br>

## 使用素材
既存のアーティスト画像は著作権にあたる為、サンプル画像として以下のサイトを利用しています。<br>
https://www.photo-ac.com/
