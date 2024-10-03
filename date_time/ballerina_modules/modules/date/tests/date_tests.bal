import ballerina/test;

@test:Config
function incrementDateByTest() {
    test:assertEquals(incrementDateBy("2024-09-30", 1, 2), "2024-10-09");
}
