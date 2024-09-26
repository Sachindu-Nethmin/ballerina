import ballerina/graphql;
import ballerina/uuid;



table<User> key(id) userTable = table[];
table<Publisher> key(id) publisherTable = table[];



NewsRecord[] newsRecords =[];

@graphql:ServiceConfig {
    graphiql: {
        enabled: true
    }
}
service /news on new graphql:Listener(9090) {
    
    resource function get users() returns User[] {
        return userTable.toArray();
    }
    resource function get publishers() returns Publisher[] {
        return publisherTable.toArray();
    }

    remote function registerUser(NewUser newuser) returns User{
        User user = {
            id: uuid:createType1AsString(),
            ...newuser
        };
        userTable.put(user);
        return user;
    } 
    remote function registerPublisher(NewPublisher newPublisher) returns Publisher{
        Publisher publisher= {
            id: uuid:createType1AsString(),
            ...newPublisher
        };
        publisherTable.put(publisher);
        return publisher;
    }

    remote function publish(NewsUpdate newsUpdate) returns NewsRecord | error{
        if publisherTable.hasKey(newsUpdate.publisherId){
            return error ("Publisher not fund");
        }
        NewsRecord newsRecord = {
        id: uuid:createType1AsString(),
        ...newsUpdate
        };
        newsRecords.push(newsRecord);
        return newsRecord;
    }
}


