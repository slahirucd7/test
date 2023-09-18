
import ballerina/http;
import ballerina/lang.runtime;
service http:Service /foo on new http:Listener(9800) {

    resource function get empId/[int id]() returns json {
        // greater than 30 bytes encoding will work 
        return {empId: id, "name": "ABCD"};
        // since less than 30 bytes encoding will not work 
        // return {empId: id, "name": "abcd"};
    }

    resource function get delayTest() returns string{
        runtime:sleep(150);
        return "Completed the delay test";
    }

}
