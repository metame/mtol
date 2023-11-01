use std::env;
use futures_util::StreamExt;
// use tokio::io::{AsyncReadExt, AsyncWriteExt};
use tokio_tungstenite::{
    connect_async,
//    tungstenite,
};
use url::{self, Url};

struct Config {
    url: Url,
    token: String,
}

impl Config {
    fn new() -> MyResult<Self> {
        let uri = "wss://irc-ws.chat.twitch.tv:443";
        let url = Url::parse(&uri)?;
        let token = env::var("TWITCH_ACCESS_TOKEN")?;

        Ok(Config {
            url,
            token,
        })
    }
}

#[derive(Debug)]
enum MyError {
    UrlParseError(url::ParseError),
    VarError(env::VarError),
}

type MyResult<T> = Result<T, MyError>;

impl From<url::ParseError> for MyError {
    fn from(err: url::ParseError) -> Self {
        MyError::UrlParseError(err)
    }
}

impl From<env::VarError> for MyError {
    fn from(err: env::VarError) -> Self {
        MyError::VarError(err)
    }
}

#[tokio::main]
async fn main() {

    let config = match Config::new() {
        Ok(config) => config,
        Err(e) => panic!("config failed with err {:?}", e),
    };

    let (mut ws_stream, _a) = connect_async(config.url).await.expect("Failed to connect");
     let (write, read) = ws_stream.split();
    read.for_each(|message| async {
        let data = message.unwrap().into_data();
        println!("{}", String::from_utf8(data).unwrap());
    }).await;

    /*
    while let Some(msg) = ws_stream.next().await {
        let msg = msg.expect("msg err");
        println!("{msg:?}");
    }
    */

}
