module Data.Holiday.USA
  ( Holiday(Holiday)
  , getHoliday
  ) where

import qualified Data.Time as Time
import qualified Data.Time.Calendar.WeekDate as Time

-- | Holiday means a "real" holiday day like you may not go to work on that day.
-- Like Mother's day isn't considered a holiday because it's on Sundays.
data Holiday =
  Holiday
    { holiday_day :: Time.Day -- ^ The actual day of the holiday
    , holiday_name :: String -- ^ The name of the holiday according to Wikipedia
    }
  deriving (Eq, Show)

-- | Returns a Holiday if the given date is
--
-- Examples:
--
-- >>> let christmas = Time.fromGregorian 2019 12 25
-- >>> getHoliday christmas
-- Just (Holiday {holiday_day = 2019-12-25, holiday_name = "Christmas"})
--
-- >>> let noHoliday = Time.fromGregorian 2019 12 20
-- >>> getHoliday noHoliday
-- Nothing
getHoliday :: Time.Day -> Maybe Holiday
getHoliday d
  | isChristmas d = Just (Holiday d "Christmas")
  | isThanksgiving d = Just (Holiday d "Thanksgiving")
  | isIndependence d = Just (Holiday d "Independence Day")
  | isNewYearsEve d = Just (Holiday d "New Year's Eve")
  | isMemorialDay d = Just (Holiday d "Memorial Day")
  | isLaborDay d = Just (Holiday d "Labor Day")
  | otherwise = Nothing
  where
    isChristmas :: Time.Day -> Bool
    isChristmas _d =
      let (_, month, day) = Time.toGregorian _d
       in month == 12 && day == 25
    isThanksgiving :: Time.Day -> Bool
    isThanksgiving _d =
      let (_, month, day) = Time.toGregorian _d
       in month == 11 && 22 <= day && day <= 28 && getDayOfWeek _d == Thursday
    isIndependence :: Time.Day -> Bool
    isIndependence _d =
      let (_, month, day) = Time.toGregorian _d
       in month == 7 && day == 4
    isNewYearsEve :: Time.Day -> Bool
    isNewYearsEve _d =
      let (_, month, day) = Time.toGregorian _d
       in month == 12 && day == 31
    isMemorialDay _d =
      let (_, month, day) = Time.toGregorian _d
       in month == 5 && 25 <= day && day <= 31 && getDayOfWeek _d == Monday
    isLaborDay _d =
      let (_, month, day) = Time.toGregorian _d
       in month == 9 && 1 <= day && day <= 7 && getDayOfWeek _d == Monday



data DayOfWeek
  = Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  | Sunday
  deriving (Enum, Eq, Show)

-- | This should be removed when 'time' package has been updated to 1.9.3+
getDayOfWeek :: Time.Day -> DayOfWeek
getDayOfWeek d =
  let (_, _, dow) = Time.toWeekDate d
   in toEnum (dow - 1)
