import ballerina/test;

@test:Config
function incrementTimeByTest() {
    test:assertEquals(incrementTimeBy("3:56", 1, 15), "5:11");
}
