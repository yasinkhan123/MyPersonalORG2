public with sharing class exportReport1 {
    public String getReportData() {
        
        Id reportId='00Oi0000005eWAS';
        if(reportId != null && reportId.getSobjectType() == Report.SobjectType) {
            PageReference ref = new PageReference('/'+reportId+'?pv1=FIS-UK&excel=1');
            System.debug(logginglevel.error,ref.geturl());
            return ref.getContent().toString();
        }        
        return null;
    }
}