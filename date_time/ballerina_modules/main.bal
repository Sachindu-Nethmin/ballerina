import ballerina_modules.date;
import ballerina_modules.time;

import ballerina/http;

service / on new http:Listener(9090) {
    resource function post incrementDate(string date, int weeks, int days) returns string|error {
        return date:incrementDateBy(date, weeks, days);
    }

    resource function post incrementTime(string time, int hours, int minutes) returns string|error {
        return time:incrementTimeBy(time, hours, minutes);
    }
}
