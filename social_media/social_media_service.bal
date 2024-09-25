import ballerina/http;
import ballerina/time;

type User record {|
    readonly int id;
    string name;
    time:Date birthDate;
    string mobileNumber;
|};

table<User> key(id) users = table [];

service /social\-media on new http:Listener(9090) {
    resource function get users() returns User[]|error {
        User joe = { id:1, name:"joe", birthDate : {year: 1990, month: 2, day: 3}, mobileNumber: "0771234567"};
        return [joe];
    }
}
