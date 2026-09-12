# 16行 × 32列・512 bit SRAM

**2026-09-12：配置配線、Drawing DRC 0、厳密LVS一致、全IP62マスクDRC 0まで完了。抽出後の電気的検証を実行中。製造用リリース判定はまだ行っていない。**

提出候補は [`layout/sram512.gds`](layout/sram512.gds)。最上位は `sram512_macro`、
外形は **横1776.7 × 縦600.0 µm**、原点は左下 `(0, 0)`。
実際の製造マスクも同じ外形内に収まる。物理配置は16行×32列で、転置していない。
現GDSのSHA-256は `bbae5a2e0a63d1d0304937d7a5edef00291f0db6eafc00ce3a7700bdafa9ab02`。

![実際のレイアウト](layout/overview.png)

## 回路と操作

- ユーザーの `klayout/sram_pcell/` のsix_single版を使用。セルは22 × 29.6 µmピッチ、全MOSはW=3.4/L=1 µm。
- 16行・32列、512 bit。nMOS列MUXと片側プルダウン書込み、共有7Tセンスアンプ。
- 32セル共通のWLを各行1個のAND3_X1から駆動。行4 bit、列5 bitの静的プリデコード。
- 受信とアクセスで同じ10 bitのフレームFFを使用。全体は21 FF。
- 外部7端子：VDD / VSS / CLK / RESET / SDI / WE / SDO。
- `RA3…RA0 CA4…CA0 DIN`を10クロックで送り、続く8クロックでアクセス。1操作18クロック。
- RESETはHIGHで非同期。メモリ内容を初期化する端子ではない。

詳細は[操作仕様](SPEC.md)。本体は `../sram512.sch`、専用TBは `../sram512_tb.sch`、
7端子の階層入口は `../sram512_macro.sch`。

## 検証状況

| 検証 | 結果 | 対象 |
|---|---|---|
| 回路図/ERC | 合格 | 512 bit専用回路とTB |
| 論理検証 | 334,063項目合格、9,270操作 | 全512アドレス、両データ、March C-、全18段階のRESET |
| 回路図のMOS基準・感度試験 | 9条件、それぞれ2,901項目合格 | 5 V基準、電源・温度・容量・Vthの感度 |
| 回路図の行列カバレッジ | 136操作、38,901項目合格 | 全16行・全32列を通る34アドレス |
| 統合Drawing DRC / LVS | **0件 / 全14回路一致** | 現GDS、厳密な外部端子照合あり |
| 製造マスクDRC | **全項目0件** | 無改変devのMDP変換とIP62チェック |
| 物理配列・外形・端子 | 合格 | 512個の6Tセル、16行×32列、7端子、600×1800 µm以内 |
| 抽出後MOS・配線RC・電源・運用試験 | **実行中** | 現GDSから抽出した4,953 MOS＋8ダイオード |

現配置の物理検証は `layout/drawing_lvs.json`、`layout/manufacturing.json`、
`layout/geometry_audit.json`。回路図のMOS試験は `reports/analog_shared_wl_*.json`。
過去の720 µm配置の結果を現GDSの合格根拠に流用していない。
過去の比較結果と不合格は[検討記録](EXPERIMENTS.md)に分けた。

## PDKとレイアウト上の変更

使用PDKは無改変のTR-1um dev、コミット `6afbd918951f2ea0dcd11c5a46986b4c20f9e6f9`。
`run.drc`、`run.lvs`、`run_mdp.drc`、`run_IP62.drc`をそのまま使用し、
waiver領域、端子無視、ブラックボックス化は使っていない。

PDKの設計側コピーでは、BUF_X4/GND等の欠落ラベルと一部ゲートの端子順を実MOS接続に
合わせて修正した。スタセルのGC/M1/M2に取り出し配線を追加し、個別のDRC/LVSも確認。
列選択ANDは共通AND2セルを子として、その外側に取り出し配線を持つ。
この階層整理の前後で製造図形のXORが空であることを検査している。

入力のDP/DNは各3.6 × 3.6 µmのまま。マスク間隔を確保するため、同じ小セル内で
DPをy=34.0、DNをy=13.05 µmへ移動し、周辺ウェルの下辺を調整した。
AND3の電源レールにある6個のウェル接点のうち端の1個を除き、残る5個を使うことで、
外側ウェルの余白を0.4 µm詰めた。MOSの位置・W/Lと論理接続は維持している。
これらは実レイアウトの変更であり、検査ルールや判定の変更ではない。

MDP出力には物理マスク以外に150/151等のデバイス認識図形も含まれる。
外形判定は公式MDPが出力する実マスク全層について行い、認識図形を含む全層外形も
JSONに記録する。認識図形は削除せず、公式DRCには全層を渡している。

## フレームとの接続

[端子座標](layout/ports.json)は最上位GDS上の実M2位置。
主催者がパッドへ配線し、共通フレームのESDを利用する前提。
コア内の小さなDP/DN対は浮遊ゲート検査に対応するもので、パッド用ESDの代替ではない。
SDOにはBUF_X4があり、検証負荷は10 pF。詳細はSPEC.mdを参照。

## 再検証

```bash
python3 sram512/verify_digital.py
python3 sram512/geometry_audit.py build/sram512/layout/final16x32 --require-origin
python3 sram512/manufacturing.py build/sram512/layout/final16x32
python3 sram512/postlayout.py build/sram512/layout/final16x32 --name final_decode_coverage --decode-coverage --solver klu
python3 sram512/postlayout.py build/sram512/layout/final16x32 --name final_rc3_low_hot --rc-scale 3 --vdd 4.5 --temperature 85 --solver klu
python3 sram512/postlayout.py build/sram512/layout/final16x32 --name final_rc_power_nominal --rc-scale 1 --power-sheet 0.1 --power-mesh-grid 0.25 --voltage-envelope --solver klu
python3 sram512/operational_tests.py build/sram512/layout/final16x32 --name final_operational_hot --solver klu
```

大きな波形と再生成物は `build/sram512/` に置き、Gitへは入れない。
GUIでTBを開く場合は `python3 sram512/open.py`。
RC係数は明記した感度試験用の仮定であり、校正済みファウンドリPEXではない。
温度・電源・Vth感度の合格を、統計的な製造ばらつきや歩留まりの保証と取り違えない。
