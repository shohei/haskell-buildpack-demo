{-# LANGUAGE OverloadedStrings #-}
module Main where

import Web.Scotty
import           Control.Applicative         ((<$>))
import           System.Environment          (getEnv)

import Data.Monoid (mconcat)

main = do
    port <- read <$> getEnv "PORT"
    scotty port $ do
        get "/:word" $ do
            beam <- param "word"
            html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]


-- import System.Environment
-- import Network.HTTP.Types (status200)
-- import Network.Wai
-- import Network.Wai.Handler.Warp (run)
--
-- application _ = return $
--   responseLBS status200 [("Content-Type", "text/plain")] "Hello world.\n\nThis is Haskell on Heroku.\nhttps://github.com/pufuwozu/haskell-buildpack-demo"
--
-- main = do
--   port <- getEnv "PORT"
--   run (fromIntegral $ read port) application
