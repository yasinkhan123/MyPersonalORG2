global class AnimalHttp {
   
    Public List<String> animalsList {get;set;}
   global  AnimalHttp(){
        animalsList = new List<String>();
    }
   
    
    global void getDataFromEndPoint(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.        
        // system.debug('response.getBody() is:' +response.getBody());
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.     
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
           // System.debug('Received the following animals:');
            for (Object animal: animals) {
                animalsList.add(string.valueOf(animal));
            }
        }
    }
    
    global void setDataToEndpoint(){   
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Set the body as a JSON object
        request.setBody('{"name":"My vodafone cat"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            // Deserialize the JSON string into collections of primitive data types.     
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
             // Cast the values in the 'animals' key as a list
             List<Object> animals = (List<Object>) results.get('animals');
             // System.debug('Received the following animals:');
             animalsList = new List<String>();
            for (Object animal: animals) {
                animalsList.add(string.valueOf(animal));
            }
        }
    }  
}