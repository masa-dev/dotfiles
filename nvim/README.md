# Neovim設定

## macOS設定

### キーボードショートカットの競合解消

`<C-Space>`キーバインド（手動補完トリガー）を使用するために、macOSの入力ソース切り替えショートカットを無効化する必要があります。

**設定手順:**
1. システム設定（System Preferences）を開く
2. キーボード（Keyboard）を選択
3. キーボードショートカット（Keyboard Shortcuts）をクリック
4. 左側メニューから「入力ソース（Input Sources）」を選択
5. 「前の入力ソースを選択（Select the previous input source）」のチェックボックスを**解除**

これにより、Neovim内で`<C-Space>`を使用した手動補完が正常に動作するようになります。

## キーバインド

詳細なキーバインド一覧は [`docs/keybindings.md`](docs/keybindings.md) を参照してください。

