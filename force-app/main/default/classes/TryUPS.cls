public with sharing class TryUPS {

    public PageReference request() {
    
        
        /* ------------------------- Code for Agreement License Request and Response ( Working ) -----------------------------*/
         
         HttpRequest req = new HttpRequest();
        Http h = new Http();
         
        String soapXML = '<?xml version="1.0" ?>';
        soapXML += '<Body>';
        soapXML += '<AccessLicenseAgreementRequest>';
        
        soapXML += '<Request>';
        soapXML += '<TransactionReference>';
        soapXML += '<CustomerContext>License Test</CustomerContext>';
        soapXML += '<XpciVersion>1.0</XpciVersion>';
        soapXML += '</TransactionReference>';
        soapXML += '<RequestAction>AccessLicense</RequestAction>';
        soapXML += '</Request>';
        soapXML += '<DeveloperLicenseNumber>2CCB7287555E3225</DeveloperLicenseNumber>';
        soapXML += '<AccessLicenseProfile>';
        soapXML += '<CountryCode>US</CountryCode>';
        soapXML += '<LanguageCode>EN</LanguageCode>';
        soapXML += '</AccessLicenseProfile>';
        soapXML += '<OnLineTool>';
        soapXML += '<ToolID>RateXML</ToolID>';
        soapXML += '<ToolVersion>1.0</ToolVersion>';
        soapXML += '</OnLineTool>';
        soapXML += '</AccessLicenseAgreementRequest>';
        soapXML += '</Body>';
        
        req.setBody(soapXML);
        req.setEndpoint('https://wwwcie.ups.com:443/web-services');
        req.setMethod('POST');
        HttpResponse res = h.send(req); 
        
        system.debug('The Value of Http Request : =' + ' ' + res.getStatus()); 
    
        return null;
    }

}