type Date record {|
    int year;
    int month;
    int day;
|};

# Cumulative days at the start of each month (non-leap year)
# This constant is not specified as a constant. Thus it is not accesible outside the module.
const int[] cumulativeDays = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365];

# Adds a specified number of weeks and days to a given date.
#
# + dateString - Date in the format `YYYY-MM-DD`
# + weeks - Number of weeks to add
# + days - Number of days to add
# + return - The resulting date in `YYYY-MM-DD` format after adding the specified weeks and days
public function incrementDateBy(string dateString, int weeks, int days) returns string|error {
    Date date = check parseDate(dateString);
    int givenDateCumulative = cumulativeDays[date.month - 1] + date.day;
    int totalDaysToAdd = weeks * 7 + days;
    int newDateCumulative = givenDateCumulative + totalDaysToAdd;

    // Determine the new month based on cumulative days
    int newMonth = getMonthFromCumulativeDays(newDateCumulative);

    // Compute the new day within the determined month
    int newDay = newDateCumulative - cumulativeDays[newMonth - 1];

    // Return the new date in the `YYYY-MM-DD` format
    return string `${date.year}-${padZero(newMonth)}-${padZero(newDay)}`;
}

function getMonthFromCumulativeDays(int day) returns int {
    int month = 1;
    while cumulativeDays[month] < day {
        month += 1;
    }
    return month;
}

function parseDate(string dateString) returns Date|error {
    string:RegExp pattern = re `-`;
    string[] parts = pattern.split(dateString);

    // Validate the date format
    if parts.length() != 3 {
        return error("Invalid date format, expected 'YYYY-MM-DD'");
    }

    // Parse year, month, and day components
    int year = check int:fromString(parts[0]);
    int month = check int:fromString(parts[1]);
    int day = check int:fromString(parts[2]);

    return {year, month, day};
}

function padZero(int value) returns string {
    return value < 10 ? string `0${value}` : value.toString();
}
