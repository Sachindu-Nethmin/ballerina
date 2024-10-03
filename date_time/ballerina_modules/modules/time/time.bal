type Time record {|
    int hours;
    int minutes;
|};

# Calculates the time after adding a specified number of hours and minutes to a given time.
#
# + inputTime - Time in the format `HH:mm` (24-hour clock)
# + addHours - Number of hours to add
# + addMinutes - Number of minutes to add
# + return - The resulting time in `HH:mm` format after adding the specified hours and minutes
public function incrementTimeBy(string inputTime, int addHours, int addMinutes) returns string|error {
    Time rec = check parseTime(inputTime);
    rec.hours += addHours;
    rec.minutes += addMinutes;

    // Adjust minutes overflow
    if rec.minutes >= 60 {
        rec.hours += rec.minutes / 60;
        rec.minutes = rec.minutes % 60;
    }

    // Adjust hours overflow (24-hour format)
    rec.hours = rec.hours % 24;

    // Format the result as `HH:mm`
    return string `${rec.hours}:${rec.minutes}`;
}

function parseTime(string timeString) returns Time|error {
    string:RegExp pattern = re `:`;
    string[] timeParts = pattern.split(timeString);

    // Validate time format (should contain exactly 2 parts: hours and minutes)
    if timeParts.length() != 2 {
        return error("Invalid time format, expected 'HH:mm'");
    }

    // Parse hours and minutes from the string parts
    int hours = check int:fromString(timeParts[0]);
    int minutes = check int:fromString(timeParts[1]);

    // Return the Time record with parsed hours and minutes
    return {hours, minutes};
}
