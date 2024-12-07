#!/bin/sh
set -e

# [初参戦のISUCONで予選敗退した話 (ヽ´ω`) < 22位 - aeroastroの日記](https://aeroastro.hatenablog.com/entry/2018/09/18/180602)
# 正規表現
# I,.* INFO -- :
# curlの出力を制御
# -o /dev/null -w '%{http_code} %{url}\n' -s

# シナリオ
curl -X POST --resolve 'pipe.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt -d '' 'http://pipe.u.isucon.local:8080/api/initialize' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X GET --resolve 'pipe.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt 'http://pipe.u.isucon.local:8080/api/payment' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X POST --resolve 'pipe.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt -d '{"username":"suzukitsubasa0","password":"v3TUBsnte9"}' 'http://pipe.u.isucon.local:8080/api/login' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X POST --resolve 'suzukitsubasa0.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt -d '{"tags":[],"title":"コスメ紹介！この春のおすすめアイテム","description":"この春の新作コスメやおすすめのアイテムを紹介します。","playlist_url":"https://media.xiii.isucon.dev/api/4/playlist.m3u8","thumbnail_url":"https://media.xiii.isucon.dev/isucon12_final.webp","start_at":1700874000,"end_at":1700899200}' 'http://suzukitsubasa0.u.isucon.local:8080/api/livestream/reservation' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X GET --resolve 'pipe.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt 'http://pipe.u.isucon.local:8080/api/user/suzukitsubasa0/statistics' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X GET --resolve 'suzukitsubasa0.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt 'http://suzukitsubasa0.u.isucon.local:8080/api/livestream/7496/statistics' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X POST --resolve 'pipe.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt -d '{"username":"suzukitsubasa0","password":"v3TUBsnte9"}' 'http://pipe.u.isucon.local:8080/api/login' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X POST --resolve 'suzukitsubasa0.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt -d '' 'http://suzukitsubasa0.u.isucon.local:8080/api/livestream/7496/enter' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X POST --resolve 'suzukitsubasa0.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt -d '{"emoji_name":"100"}' 'http://suzukitsubasa0.u.isucon.local:8080/api/livestream/7496/reaction' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X POST --resolve 'suzukitsubasa0.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt -d '{"emoji_name":"1234"}' 'http://suzukitsubasa0.u.isucon.local:8080/api/livestream/7496/reaction' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X POST --resolve 'suzukitsubasa0.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt -d '{"emoji_name":"grinning"}' 'http://suzukitsubasa0.u.isucon.local:8080/api/livestream/7496/reaction' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X POST --resolve 'suzukitsubasa0.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt -d '{"comment":"あなたの私物や日常の詳細を知りたいな〜。どこで手に入れることが多いです。","tip":9}' 'http://suzukitsubasa0.u.isucon.local:8080/api/livestream/7496/livecomment' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X POST --resolve 'suzukitsubasa0.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt -d '{"comment":"夜中の静けさとあなたの言葉、いつもの質の高い動画、感謝しかありません！応援してね。","tip":8}' 'http://suzukitsubasa0.u.isucon.local:8080/api/livestream/7496/livecomment' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X POST --resolve 'suzukitsubasa0.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt -d '' 'http://suzukitsubasa0.u.isucon.local:8080/api/livestream/7496/livecomment/1002/report' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X POST --resolve 'suzukitsubasa0.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt -d '' 'http://suzukitsubasa0.u.isucon.local:8080/api/livestream/7496/livecomment/1003/report' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X GET --resolve 'pipe.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt 'http://pipe.u.isucon.local:8080/api/user/suzukitsubasa0/statistics' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X GET --resolve 'suzukitsubasa0.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt 'http://suzukitsubasa0.u.isucon.local:8080/api/livestream/7496/statistics' -o /dev/null -w '%{http_code} %{url}\n' -s
curl -X POST --resolve 'pipe.u.isucon.local:8080:127.0.0.1' -b cookie.txt -c cookie.txt -d '{"name":"ipQTVapoAm","display_name":"きけぺぷえき","description":"普段アーティストをしています。\nよろしくおねがいします！\n\n連絡は以下からお願いします。\n\nウェブサイト: http://chiyonakamura.example.com/\nメールアドレス: chiyonakamura@example.com\n","password":"oFBTZ2FuHbl4o","theme":{"dark_mode":false}}' 'http://pipe.u.isucon.local:8080/api/register' -o /dev/null -w '%{http_code} %{url}\n' -s

echo "\n【SUCCESS】正常に実行されました"
