import ballerina/http;
import ballerina/time;

type User record {|
    int id;
    string name;
    time:Date birthDate;
    string mobileNumber;
|};

service /social\-media on new http:Listener(9090) {
    resource function get users() returns User[]|error {
    }
}
