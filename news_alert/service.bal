import ballerina/graphql;
service /news on new graphql:Listener(9090) {
    
    resource function get users() returns User[] {
        return [{
            id:"1",
            name: "John",
            age: 30
        }];
    }
}

type User record {|
    string id;
    string name;
    int age;
|};

