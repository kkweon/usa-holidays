# usa-holidays

[![Build Status](https://travis-ci.com/kkweon/usa-holidays.svg?branch=master)](https://travis-ci.com/kkweon/usa-holidays)
[![Hackage](https://img.shields.io/hackage/v/usa-holidays.svg)](https://hackage.haskell.org/package/usa-holidays)

USA Holidays library in Haskell.

## Getting Started

```haskell
let christmas = Time.fromGregorian 2019 12 25
USA.getHoliday christmas `shouldBe` Just (USA.Holiday christmas "Christmas")
```
