// twitterモジュールを読み込み
var twitter = require('twitter');

// アプリ登録時に取得したkeyを入れてOAuth認証し、初期化
var cliant = new twitter({
    consumer_key: 'CxsiVdmV8LCkiMiXLbXxXF50Q',
    consumer_secret: 'vCn9lyvx5YXibA7VEL2WvMykKI5kKzpasxTDZPwPgWBeQI8gSU',
    access_token_key: '2522892320-Ded3GZwxA03vzwsDWcYDOq8vjSwoxOhEotWVW9u',
    access_token_secret: 'uMcGCZI4d9iYZ2xeOfpkXPnvynoSFCmEPGdWRwo1KCqeF'
});

// Public APIのstatuses/filterで取得したタイムラインを、自分のアカウント名を含む文字列でフィルターする
cliant.stream('statuses/filter', { track :'@GrooveGulgul'}, function(stream) {
    // フィルターされたデータのストリームを受け取り、ツイートのテキストを表示する
    stream.on('data', function(data) {
        var text = data.text; // ツイートのテキスト
        var textCleaned = text.replace(/@GrooveGulgul/g, ""); // アカウント名は不要
        console.log( textCleaned );
    });

});
