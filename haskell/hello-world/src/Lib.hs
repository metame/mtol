{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}

module Lib
  ( greet,
    getName
  )
where

import Data.Aeson
import Data.ByteString.Lazy (ByteString)
import Data.Text.Lazy
import GHC.Generics

newtype Greeting = Greeting {greeting :: String} deriving (Show, Generic, ToJSON)

greet :: String -> Greeting
greet name = Greeting $ mconcat ["Hello ", name, "!"]

newtype Named = Named {name :: Text} deriving (Show, Generic, FromJSON)

getName :: ByteString -> Maybe Text
getName s = name <$> decode s
