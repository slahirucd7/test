import ballerina/http;
import ballerina/io;

# A service representing a network-accessible API
# bound to port `9090`.
# 
public function main() {
    io:print("service started on port 9090");
};

service / on new http:Listener(9090) {
    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name, http:Request req) returns http:Response|error {
        io:println("Service started on port 9090");
        io:println("Greeting resource got invoked: " + name);
        io:println(req.getHeaderNames());
        io:println(req.getHeader("User-Agent"));

        json responseJson = {"k1" : "v1", "k2": "v2"};

        http:Response response = new;
        response.setPayload(responseJson);
        response.setHeader("choreo-enforcer-header", "enforcer-header-value");
        return response;
    }
}
