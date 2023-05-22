module Main where

import qualified Data.ByteString.Lazy as B
import Types
import TypesRec
import Data.Aeson


main :: IO ()
main = do
  test <- B.readFile "res/test.json"
  let m = decode test:: Maybe Metagraph
  print "lol"
  print m
  let mjson = encode metagraph1
  B.writeFile "res/test_new.json" mjson

  print "============Recursive============="
  let mjson_rec = encode mretagraph1 
  print mretagraph1
  print "========"
  print mjson_rec 
  B.writeFile "res/test_rec_new.json" mjson_rec
 
  where
    metalinks = Metalinks [3,4] [] 
    metalinks2 = Metalinks [1] [] 
    metavertecies = [Metavertex 1 "Test1" Nothing
                    ,Metavertex 2 "Test2" (Just metalinks)
                    ,Metavertex 3 "Test3" (Just metalinks2)
                    ,Metavertex 4 "Test4" Nothing]
    metaedges = [Metaedge 5 "TestEdge5" 1 4 Nothing True]
    metagraph1 = Metagraph metavertecies metaedges


    mretagraph2 = MRetagraph [MRetavertex 6 "Test6" Nothing] [MRetaedge 7 "TestEdge7" 2 6 Nothing True]
    mretavertecies = [MRetavertex 1 "Test1" Nothing
                    ,MRetavertex 2 "Test2" (Just mretagraph2)
                    ,MRetavertex 3 "Test3" Nothing 
                    ,MRetavertex 4 "Test4" Nothing]
    mretaedges = [MRetaedge 5 "TestEdge5" 1 4 Nothing True]
    mretagraph1 = MRetagraph mretavertecies mretaedges
