# 512 bit シリアルSRAM — OpenSUSI TR-1um

**16行×32列の6T SRAMと周辺回路を、横1776.7×縦600.0 µmに収めた7端子のコアです。**
512個のセルを1 bitずつ指定して読み書きします。主催者側の共通フレームへ統合する相乗り提出物です。

## 提出ファイル

| 提出項目 | ファイル |
|---|---|
| 回路図（7端子の階層入口） | [schematics/sram512_macro.sch](schematics/sram512_macro.sch) |
| 全体回路図 | [schematics/sram512.sch](schematics/sram512.sch)、[閲覧用SVG](schematics/overview.svg) |
| シミュレーション用回路図 | [simulation/sram512_tb.sch](simulation/sram512_tb.sch) |
| レイアウト | **[layout/sram512.gds](layout/sram512.gds)**、top: **sram512_macro** |
| 公式MDP変換後のマスク | [layout/sram512_mask.gds](layout/sram512_mask.gds) |
| 仕様書・操作説明 | [SPEC.md](SPEC.md) |
| パッドへの接続指示 | [SUBMISSION.md](SUBMISSION.md)、[端子座標](layout/ports.json) |
| 工夫した点・アピールポイント | [APPEAL.md](APPEAL.md) |
| 検証条件・結果・制限 | [VERIFICATION.md](VERIFICATION.md) |

![レイアウト](layout/overview.png)

`.sch`から参照する`.sym`と下位回路を同梱しています。`pdk/`は使用したdev版から
無改変で抜き出した、必要な回路図・シンボル・素子モデルです。DRC/LVSルール一式は含めていません。
第三者部品の出典と著作権表示は`licenses/`と`layout/NOTICE.txt`にあります。

## 開く・シミュレーションする

Xschem、ngspice、Python 3を用意し、このフォルダで実行します。
モデルとシンボルは同梱版を使うため、別PDKのインストールや元の作業リポジトリは不要です。

```sh
python3 run.py circuit   # 7端子の回路図。下位のsram512へ階層を降りる
python3 run.py tb        # シミュレーション用回路図を開く
python3 run.py erc       # 本体とTBの接続・シンボル解決を確認
python3 run.py simulate  # バッチで16操作を実行し、PASS/FAILを表示
```

出力は`results/`です。`simulation.log`と`sram512_tb.raw`を保存します。
GUIからもTBの通常のネットリスト生成・シミュレーション操作で波形を表示できます。
モデルのDP/DNに含まれる`IMAX/IMELT`はngspiceでは未対応で、元モデル由来の警告が出ます。
モデルは変更していません。ダイオードの破壊・ESD耐量を計算した試験ではありません。

## 概要と検証

- 電源基準5 V。外部端子はVDD / VSS / CLK / RESET / SDI / WE / SDO。
- 10クロックで行4bit・列5bit・データ1bitを受信し、8クロックでアクセス。合計18クロック。
- RESETはHIGHで非同期。セルの内容は初期化しません。
- Drawing DRC 0、厳密LVS全14回路一致、公式変換後の製造マスクDRC 0。
- 公式配線PEXは未提供のため、詳細な配線検証は仮定した係数による簡易RCモデルです。
- 最大端子間電圧5.7475 Vで、採用した5.75 V基準までの余裕は約2.5 mVです。
  この合格から、電源・製造ばらつきに対する十分な余裕を保証してはいません。

同梱TBは回路図のMOS＋仮定した集中容量の試験です。詳細配線RCの長時間試験は別に行い、
結果を`verification/`へ収録しています。両者の範囲を[VERIFICATION.md](VERIFICATION.md)で説明します。

パッドへの配線とパッドESDは主催者側の共通フレームを利用する前提です。
コア側にはSDOの出力バッファを実装しています。統合後のチップ全体の検証は統合側で行ってください。
Drawing GDSと変換済みマスクGDSを区別し、変換済みマスクへMDPを再適用しないでください。

## 出典・保存版の識別

PDK：[OpenSUSI/TR-1um](https://github.com/OpenSUSI/TR-1um)、devコミット
`6afbd918951f2ea0dcd11c5a46986b4c20f9e6f9`。
GDS SHA-256：`56810ad742a73036fb9db5207c75a2fcd63d344833c17da5f6270f1dc128bca1`。
全同梱ファイルのチェックサム・元の場所は`MANIFEST.json`に記載しています。
このフォルダは提出用コピーです。開発元はリポジトリの`sram512/`です。
