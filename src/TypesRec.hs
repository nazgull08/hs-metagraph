{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DeriveAnyClass #-}

module TypesRec (
  MRetagraph(..)
  ,MRetaedge(..)
  ,MRetavertex(..)
) where

import Data.Aeson.TH
import Data.Aeson
import GHC.Generics
import qualified Data.HashMap.Strict as M
import qualified Data.Text as T

data MRetavertex = MRetavertex
  { mvrid :: Int
  , mvrpayload :: T.Text
  , mvrmetagraph :: Maybe MRetagraph 
  } deriving (Show, Eq, Generic, ToJSON, FromJSON)

data MRetaedge = MRetaedge 
  { merid :: Int
  , merpayload :: T.Text
  , mervertex_start :: Int 
  , mervertex_end :: Int
  , mermetagraph :: Maybe MRetagraph
  , meroriented :: Bool
  } deriving (Show, Eq, Generic, ToJSON, FromJSON)

data MRetagraph = MRetagraph 
  { rmeta_vertecies :: [MRetavertex]
  , rmeta_edges :: [MRetaedge]
  } deriving (Show, Eq, Generic, ToJSON, FromJSON)


