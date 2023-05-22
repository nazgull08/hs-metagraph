{-# LANGUAGE DeriveAnyClass #-}

module Types (
  Metagraph(..)
  ,Metalinks(..)
  ,Metaedge(..)
  ,Metavertex(..)
) where

import Data.Aeson.TH
import Data.Aeson
import qualified Data.HashMap.Strict as M
import qualified Data.Text as T

data Metalinks = Metalinks
  { mlmeta_vertecies :: [Int]
  , mlmeta_edges :: [Int]
  } deriving (Show, Eq)

deriveJSON defaultOptions{fieldLabelModifier = drop 2} ''Metalinks

data Metavertex = Metavertex
  { mvid :: Int
  , mvpayload :: T.Text
  , mvmetagraph :: Maybe Metalinks
  } deriving (Show, Eq)

deriveJSON defaultOptions{fieldLabelModifier = drop 2} ''Metavertex

data Metaedge = Metaedge 
  { meid :: Int
  , mepayload :: T.Text
  , mevertex_start :: Int 
  , mevertex_end :: Int
  , memetagraph :: Maybe Metalinks
  , meoriented :: Bool
  } deriving (Show, Eq)

deriveJSON defaultOptions{fieldLabelModifier = drop 2} ''Metaedge

data Metagraph = Metagraph 
  { meta_vertecies :: [Metavertex]
  , meta_edges :: [Metaedge]
  } deriving (Show, Eq)

deriveJSON defaultOptions ''Metagraph

