import ballerina/io;
import ballerina/http;


// // avoids gzip encoding
// @http:ServiceConfig {
//     compression: {
//         enable: http:COMPRESSION_NEVER,
//         contentTypes: ["text/plain","application/json"]
//     }
// }

// @http:ServiceConfig {
//     compression: {
//         enable: http:COMPRESSION_ALWAYS,
//         contentTypes: ["text/plain","application/json"]
//     }
// }

service http:Service /foo on new http:Listener(9800) {
    resource function post bar(@http:Payload json payload) returns json {
        io:println(payload);
        return payload;
    }

    resource function get empId/[int id]() returns json {
        // greater than 30 bytes encoding will work 
        return {empId: id, "name": "ABCD"};
        // since less than 30 bytes encoding will not work 
        // return {empId: id, "name": "abcd"};
    }

}