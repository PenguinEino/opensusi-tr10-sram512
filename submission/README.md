# 512 bit シリアルSRAM — OpenSUSI TR-1um

**16行×32列の6T SRAMと周辺回路を、横1776.7×縦600.0 µmに収めた7端子のコアです。**
主催者側の共通フレームへ統合する相乗り提出物です。

## 提出ファイル

| 提出項目 | ファイル |
|---|---|
| 回路図（7端子の階層入口） | [sram512_macro.sch](sram512_macro.sch) |
| 全体回路図 | [sram512.sch](sram512.sch) |
| シミュレーション用回路図 | [sram512_tb.sch](sram512_tb.sch) |
| レイアウト | **[sram512.gds](sram512.gds)**、top: **sram512_macro** |
| 公式MDP変換後のマスク | [sram512_mask.gds](sram512_mask.gds) |
| 仕様書・操作説明 | [SPEC.md](SPEC.md) |
| 端子座標・パッドへの接続指示 | [SUBMISSION.md](SUBMISSION.md) |
| 工夫した点・アピールポイント | [APPEAL.md](APPEAL.md) |
| 検証条件・結果・制限 | [VERIFICATION.md](VERIFICATION.md) |

同じ場所の下位回路図と`.sym`も必要です。すべて同じフォルダに置いたまま使ってください。
PDK・モデル・画像・JSON・ログ・実行スクリプトはこのフォルダには同梱していません。

## 開く・シミュレーションする

Xschem、ngspiceと、無改変のTR-1um dev PDKを使用します。PDKの固定コミットは
`6afbd918951f2ea0dcd11c5a46986b4c20f9e6f9`です。
TR-1um用に設定したXschemで、このフォルダから開きます。

```sh
xschem sram512_macro.sch
xschem sram512_tb.sch
```

必要なシンボル検索先は、このフォルダ、Xschem標準ライブラリ、PDKの
`libs.tech/xschem`、`TR-1umLIB`、`TR-1um_5_stdcell`です。
TBのモデル参照に使うTcl変数`LIB`は、PDKの`libs.tech/spice/models`に設定します。
TBを通常のNetlist → Simulateで実行すると、波形と16操作のPASS/FAILを表示します。
モデルのDP/DNに含まれる`IMAX/IMELT`はngspiceで未対応のため、元モデル由来の警告が出ます。

開発リポジトリ上では、ルートから次のコマンドでも提出用TBを開けます。
ログ・波形は開発側の`build/sram512/submission_check/`へ出力します。

```sh
python3 sram512/tools/submission_runner.py tb
python3 sram512/tools/submission_runner.py simulate
```

## 概要と検証

- 電源基準5 V。VDD / VSS / CLK / RESET / SDI / WE / SDOの7端子。
- 行4bit・列5bit・データ1bitを10クロックで受信し、8クロックでアクセス。合計18クロック。
- Drawing DRC 0、厳密LVS全14回路一致、公式変換後の製造マスクDRC 0。
- 詳細配線RCは仮定した係数による簡易モデル。最大端子間電圧の5.75 V基準までの余裕は約2.5 mV。

検証条件と制限は[VERIFICATION.md](VERIFICATION.md)に記載しています。
詳細な検証データと提出ファイルのチェックサムは開発リポジトリに保存しています。

パッドへの配線・パッドESDは主催者側の共通フレームを利用する前提です。
SDO出力バッファはコア側に実装しています。
Drawing GDSと変換済みマスクGDSを区別し、変換済みマスクへMDPを再適用しないでください。
