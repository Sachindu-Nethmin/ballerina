# Module Overview

This module provides functions to perform time-related calculations, such as adjusting a given time by a specified number of hours and minutes.

## Available Functions:
- **`incrementTimeBy`**  
    Adds a specified number of hours and minutes to a given time in `HH:mm` format, adjusting for minute overflow and ensuring the result adheres to the 24-hour clock system.

## Usage Example:

```ballerina
// Example of calculating new time
string result = check time:incrementTimeBy("14:30", 2, 45);
io:println(result); // Output: 17:15
```
