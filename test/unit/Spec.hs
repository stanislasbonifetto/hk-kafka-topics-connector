import Test.Hspec
import Configuration

main :: IO ()
main = hspec $ do
  describe "local" $ do
    it "name" $ do
      name local `shouldBe` "local"
    
    it "brokers" $ do
      brokers local `shouldBe` ["localhost:9092"]