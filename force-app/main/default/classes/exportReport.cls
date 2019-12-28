public with sharing class exportReport {
    public String urllink {get;set;}
    public String urllink1 {get;set;}
    public Boolean setDownLoad {get;set;}
    
    public exportReport() { }
    public exportReport(ApexPages.StandardController controller) {        
       urllink = 'https://'+ApexPages.currentPage().getHeaders().get('Host')+'/'+'00Oi0000005eWAS'+'?export=1&enc=UTF-8&xf=xls';
       urllink1 = 'https://'+ApexPages.currentPage().getHeaders().get('Host')+'/'+'00Oi0000005eW9K'+'?export=1&enc=UTF-8&xf=xls';
    }
    
    public void downloadReports (){
        setDownLoad = true;
    }

  /* public String getReportData() {
        
        Id reportId='00Oi0000005eW9K';
        if(reportId != null && reportId.getSobjectType() == Report.SobjectType) {
            PageReference ref = new PageReference('/'+reportId+'?pv1=FIS-UK&excel=1');
            System.debug(logginglevel.error,ref.geturl());
            return ref.getContent().toString();
        }        
        return null;
    } */
    
    
}