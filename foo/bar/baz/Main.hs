import Lib
import Foo (theMeaningOfLife)

import Options.Applicative
  ( optional
  , (<**>)
  , argument
  , command
  , eitherReader
  , help
  , info
  , long
  , option
  , header
  , auto
  , showDefault
  , metavar
  , fullDesc
  , progDesc
  , defaultPrefs
  , short
  , showDefaultWith
  , strOption
  , switch
  , value
  , execParser
  , execParserPure
  , helper
  , hsubparser
  , Parser
  , ParserResult
  , ReadM
  )

data Sample = Sample
  { hello      :: String
  , quiet      :: Bool
  , enthusiasm :: Int
  }

sample :: Parser Sample
sample = Sample
      <$> strOption
          ( long "hello"
         <> metavar "TARGET"
         <> help "Target for the greeting" )
      <*> switch
          ( long "quiet"
         <> short 'q'
         <> help "Whether to be quiet" )
      <*> option auto
          ( long "enthusiasm"
         <> help "How enthusiastically to greet"
         <> showDefault
         <> value 1
         <> metavar "INT" )

main :: IO ()
main = do
  putStrLn "Hello from foo/bar/baz/Main.hs!"
  someFunc
  putStrLn $ "The meaning of life is " <> show theMeaningOfLife <> "."
  greet =<< execParser opts
  where
    opts = info (sample <**> helper)
      ( fullDesc
     <> progDesc "Print a greeting for TARGET"
     <> header "hello - a test for optparse-applicative" )

greet :: Sample -> IO ()
greet (Sample h False n) = putStrLn $ "Hello, " ++ h ++ replicate n '!'
greet (Sample h True _)  = putStrLn $ "hello, " ++ h ++ "."
