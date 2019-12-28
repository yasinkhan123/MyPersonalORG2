public class BillingCalloutService {
    @future(callout = true)
    public static void callBillingService(String projectid, Double billingAmount){
        ServiceCredentials__c srvcCrd = ServiceCredentials__c.getValues('BillingServiceCredential');
                
        BillingServiceProxy.project projectInst = new BillingServiceProxy.project();
        projectInst.username = srvcCrd.Username__c;
        projectInst.password = srvcCrd.Password__c;
        projectInst.projectid = projectid;
        projectInst.billAmount = billingAmount;
        system.debug('projectInst :'+projectInst);
        BillingServiceProxy.InvoicesPortSoap11 invPortSoapInst = new BillingServiceProxy.InvoicesPortSoap11();
        String response = invPortSoapInst.billProject(projectInst);
        
        List<Project__c> lstOfProjects = new List<Project__c>();
        system.debug('response :'+response);
        if(response != null && response.equalsIgnoreCase('OK')){
            List<Project__c> lstOfPrjts = [SELECT Status__c FROM Project__c WHERE ProjectRef__c = :projectid];
            for(Project__c prjt : lstOfPrjts){
                prjt.Status__c = 'Billed';
                
                lstOfProjects.add(prjt);
            }
            
            UPDATE lstOfProjects;
        }
    }
}