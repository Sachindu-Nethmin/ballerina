import ballerina/io;

const A = "a";
configurable string password = ?;

public function main() {
    // Functions and variables declared outside this file in the same module are 
    // accessible from this module
    io:println(foo());
    io:println("Hello, World!");
}
