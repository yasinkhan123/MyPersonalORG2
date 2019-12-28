public class WebServerAuthenticationFlowController {
    
    public HttpResponse setUpAuthentication(){
        //Authorization: https://login.salesforce.com/services/oauth2/authorize
        
            
            Http toSend = new Http();
            HttpRequest request=new HttpRequest();
            request.setEndpoint('https://login.salesforce.com/services/oauth2/authorize');
            request.setBody('response_type=code&client_id=3MVG9A2kN3Bn17hub1GkWGUoMEb0p2YSyVoMAx58lwsNGy9YvdNQTlboLiBBzOpGOWhYzY0Kz9gKI4QsiO.xQ&redirect_uri=https://c.na78.visual.force.com/apex/WebServerAuthenticationFlow');
            request.setMethod('GET');
            HttpResponse resp=toSend.send(request);
            system.debug('sent:'+resp.getBody());
         
        return null;
    }
    
    public HttpResponse getUpAccessToken(){
        // Token Request: https://login.salesforce.com/services/oauth2/token
         Http toSend = new Http();
         HttpRequest request=new HttpRequest();
          request.setMethod('POST');
         request.setEndpoint('https://login.salesforce.com/services/oauth2/authorize');
         request.setBody('grant_type=authorization_code&code=code&client_id=3MVG9A2kN3Bn17hub1GkWGUoMEb0p2YSyVoMAx58lwsNGy9YvdNQTlboLiBBzOpGOWhYzY0Kz9gKI4QsiO.xQ&client_secret=&redirect_uri=https://testlightningconcept-dev-ed--c.na46.visual.force.com/apex/WebServerAuthenticationFlow');
             HttpResponse resp=toSend.send(request);
            system.debug('sent:'+resp.getBody());
        return null;
    }
}