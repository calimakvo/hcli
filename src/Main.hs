{-# LANGUAGE DeriveDataTypeable #-}
module Main where

import System.Console.CmdArgs

data CalcType = Fib | Sum | Unk deriving(Show, Data, Typeable)

data Option = Option {
    calctype :: CalcType
  , maxint :: Int
} deriving(Show, Data, Typeable)

option :: Option
option = Option {
    calctype = Unk &= name "t" &= name "type" &= help "calculate type fib or sum"
  , maxint = -1 &= name "m" &= name "max" &= help "calculate number set 1 to 100"
} &= help "command line option sample"
  &= program "hcli"

main :: IO ()
main = do
  opt <- cmdArgs option
  case chk opt of
    Right (Option ct mx) -> do
      let ans = calc opt
      case ct of
        Fib -> putStrLn $ "Fibonacci " ++ show(mx) ++ " : " ++ show(ans)
        Sum -> putStrLn $ "Sum       " ++ show(mx) ++ " : " ++ show(sum ans)
        _ -> error "do not run code."
    Left err -> putStrLn err

chk :: Option -> Either String Option
chk (Option Unk _) = Left "-t is should be set fib or sum."
chk (Option _ (-1)) = Left "-m is should be set 1 to 100."
chk opt@(Option _ mx) = if mx > 100 then
                            Left "-m is should be set 1 to 100"
                        else
                            Right opt

mode :: Mode (CmdArgs Option)
mode = cmdArgsMode option

calc :: Option -> [Int]
calc (Option Sum mx) = [1..mx]
calc (Option Fib mx) = fib mx

fib :: Int -> [Int]
fib 0 = []
fib 1 = [fib' 1]
fib n = fib (n-1) ++ [fib' n]

fib' :: Int -> Int
fib' 0 = 0
fib' 1 = 1
fib' n =  fib' (n-1) + fib' (n-2)
