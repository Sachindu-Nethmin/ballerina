# Module Overview

This module provides functions to perform date-related calculations, such as adjusting a given date by a specified number of weeks and days.

## Available Functions:

- **`incrementDateBy`**  
    Adds a specified number of weeks and days to a given date in `YYYY-MM-DD` format, ensuring proper month transitions and date calculation.

## Usage Example:

```ballerina
// Example of calculating new date
string result = check date:incrementDateBy("2024-09-30", 1, 1);
io:println(result); // Output: 2024-10-08
