module Main (main) where

import Lib
import Data.Text.Lazy.Encoding (decodeUtf8)
import Network.HTTP.Types (status400)
import Web.Scotty

main :: IO ()
main = scotty 3000 $ do
  -- \* GET `/hello` returns text response of "Hello World!"
  get "/hello" $ text "Hello World!"

  -- \* GET `/hello/<name>` returns json response of `{"greeting": "Hello <name>!"}`
  get "/hello/:name" $ do
    name <- captureParam "name"
    json $ greet name

  -- \* POST `/goodbye` takes a json payload of `{"name":string}` and returns text response of "Goodbye <name>"
  post "/goodbye" $ do
    b <- body
    case getName b of
      Just n -> text $ "Goodbye " <> n
      Nothing -> do
        status status400
        text $ decodeUtf8 $ "wtf you do: \n " <> b
