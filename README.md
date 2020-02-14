# Modelica library for propulsion & power systems

## License
All library source cords and example models are licensed with GPL v3.

## Purpose & Usage
This is the library of thermo-fluid and thermodynamic calculation components mainly for modeling of aircraft's propulsion system. 
Those components can be used not only in aircraft propulsion but also in other thermo-fluid/thermodynamic system such as turbocharger of automotive engine, air conditioning system, and so on.

## Documentation
link to top-page of documentation (notice under development):
https://zeta-plusplus.github.io/PropulsionSystem/



# 自作Modelicaライブラリ 推進・パワーシステム

## ライセンス
すべてのライブラリソースコードおよびExampleモデルはGPL v3ライセンスを付与しています。

## 用途
航空機の推進器モデリング向けに作成した、熱流体力学・熱サイクル計算用ライブラリです。コンポーネントモデルは航空用推進器に限定したものではないので、他の用途にも利用していただけます。例えば、「Compressor」コンポーネントを別途用意したモータモデルに繋いで高圧空気元要素として使う、「Turbine」コンポーネントを自動車過給機のタービンとして使う、と言った使い方が可能です。

## ドキュメンテーション
ドキュメントのトップページへのリンク（多くが工事中）：https://zeta-plusplus.github.io/PropulsionSystem/

## 例モデル
Example内に例モデルを収録しています。ライブラリ利用時の参考や熱流体・熱サイクルの学習にどうぞ。ただし、例モデルを用いて発生した如何なる事態に対しても作者zeta-plusplusは責任を負いませんので、個人の責任でご利用ください。

## tableDataについて
本ライブラリ内のモデル・コンポーネントには，テキストファイルのテーブルデータ読込を行うものが有ります。当該機能を使えるようにするためには，フォルダ「tableData」を，ローカルのOMEditワーキングディレクトリ（Tools -> Options -> General -> Working Directory で指定されているフォルダ）に置いて下さい。
収録しているテーブルデータの数値は一例として作成したものなので編集されて構いません。（＊物理的に非現実的な値を入れるとモデルが解無しで落ちる可能性が有るので値のチューンは自己責任でお願いします。）

## 関連Webページ
http://virtuallabmodelica.blog.jp/
ライブラリ・モデル製作記，解説ページです。使い方Manualの記事は有りませんが，コンポーネント内部の機能やプログラム作成上の思想などを解説しており，参考になれば幸いです。

## お願い
開発途上であり，頻繁かつ不定期更新を行うこと，そして，まだ実装に至っていない基礎機能が多々ある事をお許し下さい。
多くの方に本ライブラリを使う・遊んで頂き，Modelica学習・導入へ前向きなって頂くこと，また，熱機関を主としたマルチドメインシステムへの興味を持って頂く事を願い，本ライブラリをオープンソース公開しています。是非ダウンロードし，遊び倒して下さい。
ライブラリ作成にあたり動作確認・Debugで作成したモデルファイルも総て「Example」内に収録しています。ライブラリ内のコンポーネントの使い方が初めは判らずとも，Exampleを動かして遊ぶことから初めて頂くことで使い方・ライブラリの中身の理解を促せるだろうとの意図です。
Eメールなど，個人的な連絡手段を通したライブラリ使用上の問い合わせは，ご遠慮下さい。逆に，上記のWebページのコメント機能を通して，Exampleのモデル・ライブラリで遊んだ結果の報告・疑問点問合せ・トラブル・納得できない計算結果・バグなどの展開を下さるのは大歓迎です。可能な限り迅速なレスポンスに努めます。

## 注意
コードを整理・整頓していく中で不要になり，OpenModelicaEditor上では放棄したソースファイルやバックアップファイルがライブラリディレクトリ内には残ってしまっている可能性が有ります。そのため，読解目的でソースを参照される場合もOpenModelica等のModelica編集ソフトを通すことをお勧めします。

Copyright (C) zeta-plusplus
