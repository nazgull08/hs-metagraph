module Main where

import qualified Data.ByteString.Lazy as B
import Types
import Data.Aeson


main :: IO ()
main = do
  test <- B.readFile "res/test.json"
  let mm = decode test:: Maybe Metagraph
  print "lol"
  print mm


