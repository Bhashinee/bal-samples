import ballerina/data.xmldata;
import ballerina/http;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /convert on listener3 {
    resource function post convert(@http:Payload json input) returns error|xml {
        do {
            xml xmlResult = check xmldata:fromJson(input);
            return xmlResult;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}

listener http:Listener listener3 = new (port = 8090);
