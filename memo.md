# ページクロール部分に必要な機能洗い出し
- Angularなどで書かれた部分をrenderしたうえで全文を保存(この時ページの親子関係は情報として保持するが、DBテーブルを分けるなどのことはしない。あくまでも十把一絡げに単一のDBに保存する)
- sitemap.xmlの読み取り
- JS不要な場合はMechanizeで読み取らせる。JS必要な場合はChromeCLIを利用する

- pageのHTML読み込み自体は実行速度を考慮してNokogiriを単体で叩くorChromeCLI

- ChromeCLIは遅いので、JSデコードの必要性を判定して、自動的に切り替える(ついでにフラグとか立てられるといいね)
- pageの差分チェック
- pageが何らかの理由によりパース出来なかったときのエラー処理と、それを示す何らかのフラグをたてる

# 最低限キャッチしないといけないエラー
- RuntimeError
- URI::InvalidURIError
- OpenURI::HTTPError
- SocketError

# 色々懸案事項
- 相対URLと絶対URLをちゃんと判別して正しく叩いてあげる必要がある
- これけっこう全体的にメンドイぞ
- マジの分析部分はPythonで書く必要性がある(色々ライブラリとかの関係で)
