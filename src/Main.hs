module Main where

import qualified Data.ByteString.Lazy as B
import Types
import Data.Aeson


main :: IO ()
main = do
  test <- B.readFile "res/test.json"
  let m = decode test:: Maybe Metagraph
  print "lol"
  print m
  let mjson = encode metagraph1
  B.writeFile "res/test_new.json" mjson
 
  where
    metalinks = Metalinks [3,4] [] 
    metalinks2 = Metalinks [1] [] 
    metavertecies = [Metavertex 1 "Test1" Nothing
                    ,Metavertex 2 "Test2" (Just metalinks)
                    ,Metavertex 3 "Test3" (Just metalinks2)
                    ,Metavertex 4 "Test4" Nothing]
    metaedges = [Metaedge 5 "TestEdge5" 1 4 Nothing True]
    metagraph1 = Metagraph metavertecies metaedges


