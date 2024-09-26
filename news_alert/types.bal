type User record {|
    readonly string id;
    string name;
    int age;
|};
type NewUser record{|
    string name;
    int age;
|};

type Publisher record {|
    readonly string id;
    *NewPublisher;

|};
type NewPublisher record {|
    string name;
    string area;
    Agency agency;

|};
type NewsUpdate record {|
    string headline;
    string content;
    string publisherId;

|};

type NewsRecord record {|
    readonly string id;
    *NewsUpdate;
|};
enum Agency {
    BBC,
    CNN,
    FOX
}
