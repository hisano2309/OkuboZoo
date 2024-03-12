# 会員制サイト販促ツール

### 概要
- 動物園WEBサイトを作成し会員専用コンテンツを設置
- 会員ページにログインすると、１日１回ガチャが回せてポイントが貯まる
- 貯めたポイントで好きなアイテムと交換ができる

### 使用技術
- バックエンド
    - Java(Servlet/JSP)
    - MySQL
- フロントエンド
    - HTML
    - CSS
    - Bootstrap
    - JavaScript

### 言語使用率
- Java 66.8%
- CSS 27.2%
- JavaScript 6.0%


 ***


### 制作背景
- 会員制サイトに設置できる販促ツールを開発したいと考え、ログインボーナスとしてのガチャ機能の開発に至った
- ユーザーにとっては毎日サイトにアクセスするモチベーションになり、提供者側も少ないコストでサイトへのアクセスを増やすことが出来る

### 利用者のペルソナ
- 動物に興味がある学生や、子供のいる家族
- 動物園のチケットやグッズも欲しい
- 機会があれば動物園に行きたいと思っているがきっかけがない

### 設計方針
- 動物が好きなので架空の動物園のサイトを制作
- 会員登録後、ログインすると１日１回ガチャチケットを付与
- ガチャチケットを消費しガチャを回すと、翌日の０時に再度ガチャチケットを付与、ポップアップでガチャが引ける旨のお知らせを表示
- 毎日楽しめるコンテンツを設置することでユーザーに日常的にログインしてもらい、顕在的に販促を促す

### 機能一覧
- 基本情報
    - ユーザー登録、更新
    - ユーザー情報表示
    - ログイン、ログアウト
- エンタメ機能
    - ポイントが当たるガチャ
    - ポイントを消費してアイテムと交換

### 進捗管理
![image](https://github.com/hisano2309/OkuboZoo/assets/150416585/cae0a0c4-b3fc-4a0c-8411-085639197951)
![image](https://github.com/hisano2309/OkuboZoo/assets/150416585/3335204a-f642-48ec-9f4e-9b484def17e3)


### 画面設計
![image](https://github.com/hisano2309/OkuboZoo/assets/150416585/ea6b4834-6413-411e-904a-017425158829)

### データ設計
![image](https://github.com/hisano2309/OkuboZoo/assets/150416585/664a50a9-d1f0-4012-b6f5-333d5221bdc7)


### 工夫したこと・反省点
- モーダルウィンドウを活用し画面遷移をなるべく少なくすることで、ユーザビリティを向上した
- ガチャにアニメーションを使用し、視覚的に楽しめる演出を組み込んだ
- ガチャの景品は変数に入れてランダムで排出するようにしたが、景品をDBで管理すればポイント以外も排出可能にできた
- 「交換したアイテムを使用する」等のボタンを設置しアイテムが消費される機能を追加すれば、現地でスマホをスタッフに提示でき、より実用的なシステムにできた
