# 利用した部品と出典

TR-1um PDK、スタンダードセル、素子モデル、DRC/LVS/MDPルールは
[OpenSUSI/TR-1um](https://github.com/OpenSUSI/TR-1um) のdevコミット
`6afbd918951f2ea0dcd11c5a46986b4c20f9e6f9`を使用する。
2026-09-12 13:42 UTCにも公開dev先端との一致とローカル無改変を確認した。

元の著作権表示とライセンスの写し：

- [TR-1umのApache License 2.0と著作権表示](licenses/TR-1um-LICENSE.txt)
- [IP62の著作権表示](licenses/IP62-NOTICE.txt)

GDSにはPDKのスタンダードセルや素子形状に由来する部品を含む。
設計側で変更した箇所は[レイアウトの変更通知](layout/NOTICE.txt)と
[検討記録](EXPERIMENTS.md)に示す。PDK本体と判定ルールは変更していない。

SRAMのPCell生成元は、このリポジトリの `klayout/sram_pcell/build.py`。
ユーザーが作成したsix_single版のbitcell形状を保持し、同梱した元の生成コードと
最終GDSのbitcellを全図形層で比較する。
