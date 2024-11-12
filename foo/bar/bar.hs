import qualified Bar.Baz.Quux as Q

someNumber :: Int
someNumber = 3

main :: IO ()
main = do
  putStrLn "Hello from foo/bar/Main.hs!"
  putStrLn $ "The meaning of life is " <> show Q.doublePi <> "."
