global class SFDCAssetItem { 
    public ContentVersion contentData {get;set;} 
    public String contentBody {get;set;} 
    
    public SFDCAssetItem(ContentVersion cv, String body) { 
    this.contentData = cv; 
    this.contentBody = body; 
    } 
}