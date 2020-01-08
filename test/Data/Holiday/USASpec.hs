module Data.Holiday.USASpec where

import Test.Hspec

import qualified Data.Holiday.USA as USA
import qualified Data.Time as Time

spec :: Spec
spec =
  describe "Data.Holiday.USASpec" $ do
  it "returns Christmas on 2019/12/25" $ do
    let christmas = Time.fromGregorian 2019 12 25
    USA.getHoliday christmas `shouldBe` Just (USA.Holiday christmas "Christmas")
  it "returns Thanksgiving on 2019/11/28" $ do
    let thanksgiving = Time.fromGregorian 2019 11 28
    USA.getHoliday thanksgiving `shouldBe` Just (USA.Holiday thanksgiving "Thanksgiving")
  it "returns Independence Day on 2019/07/4" $ do
    let independence = Time.fromGregorian 2019 7 4
    USA.getHoliday independence `shouldBe` Just (USA.Holiday independence "Independence Day")
  it "returns New Year's Eve on 2019/1/1" $ do
    let newYear = Time.fromGregorian 2019 12 31
    USA.getHoliday newYear `shouldBe` Just (USA.Holiday newYear "New Year's Eve")
  it "returns Memorial Day on 2019/5/27" $ do
    let memorialDay = Time.fromGregorian 2019 5 27
    USA.getHoliday memorialDay `shouldBe` Just (USA.Holiday memorialDay "Memorial Day")
  it "returns Labor Day on 2019/9/2" $ do
    let laborDay = Time.fromGregorian 2019 9 2
    USA.getHoliday laborDay `shouldBe` Just (USA.Holiday laborDay "Labor Day")
  it "returns Martin Luther King Jr. Day on 2020/1/20" $ do
    let day = Time.fromGregorian 2020 1 20
    USA.getHoliday day `shouldBe` Just (USA.Holiday day "Martin Luther King Jr. Day")
