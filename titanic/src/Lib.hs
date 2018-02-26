{-# LANGUAGE DataKinds, FlexibleContexts, TemplateHaskell #-}

module Lib where

  import Frames
  import qualified Control.Foldl as L
  import qualified Data.Foldable as F
  import Data.Proxy (Proxy(..))
  import Lens.Micro
  import Lens.Micro.Extras
--  import Frames
  import Frames.CSV (readTableOpt, rowGen, RowGen(..))
  import Pipes hiding (Proxy)
  import qualified Pipes.Prelude as P

  someFunc :: IO ()
  someFunc = print("someFunc")



  tableTypes "Passenger" "/projects/titanic/data/train.csv"

  rowStream :: MonadSafe m => Producer Passenger m ()
  rowStream = readTable "data/train.csv"

  loadRows :: IO (Frame Passenger)
  loadRows = inCoreAoS rowStream
