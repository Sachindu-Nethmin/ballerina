# Ballerina Module Demonstration: Date and Time Service

This project demonstrates how to use **modules** in the Ballerina language to structure and organize related functionalities. It showcases how modules allows to group functions, control visibility, and expose only the necessary operations via a service.

## Project Overview

The Ballerina service provided in this project performs **date** and **time** calculations. It is divided into two separate modules:

- **Date Module**: Handles operations related to date manipulation, such as calculating the date after adding a specified number of weeks and days.
- **Time Module**: Manages time-related operations, such as calculating the time after adding a specified number of hours and minutes.

Each module encapsulates its own set of operations, demonstrating how modules keeps code clean, and organized.

## Service Endpoints

The service exposes two key endpoints for interacting with the **date** and **time** modules:

### 1. `/incrementDate`

- **Description**: Adds a specified number of weeks and days to a given date.
  - **Method**: `POST`
  - **Parameters**:
  - `date`: The starting date in `YYYY-MM-DD` format.
  - `weeks`: Number of weeks to add.
  - `days`: Number of days to add.

  ```bash
  curl -X POST "http://localhost:9090/incrementDate?date=2024-09-25&weeks=2&days=5"
  ```

### 2. `/incrementTime`

- **Description**: Adds a specified number of hours and minutes to a given time.
- **Method**: `POST`
- **Parameters**:
  - `time`: The starting time in `HH:mm` format.
  - `hours`: Number of hours to add.
  - `minutes`: Number of minutes to add.
- **Example Request**:

  ```bash
  curl -X POST "http://localhost:9090/incrementTime?time=14:30&hours=2&minutes=45"
  ```

## How to Run the Service

1. Clone the repository and navigate to the project directory.
2. Build and run the Ballerina service:

   ```bash
   $ bal run
   ```
