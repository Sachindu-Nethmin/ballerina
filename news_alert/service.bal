import ballerina/graphql;
service /news on new graphql:Listener(9090) {
    
    resource function get users() return User[] {
        return [{
            id:"1",
            name: "John",
            age: 30
        }];
    }
}

type User recode {|
    string id;
    string name;
    int age;
|};

