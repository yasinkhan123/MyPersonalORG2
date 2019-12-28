public class feedAttachmentListVFC {
    ContentDocumentLink feedAttachmentList {get;set;}

    public ContentDocumentLink getFeedAttachmentList() {
    feedAttachmentList = [SELECT ContentDocument.LatestPublishedVersionId, ContentDocument.title,ContentDocumentId FROM ContentDocumentLink WHERE ContentDocumentId = : '069i0000002oMDI' limit 1];
        return feedAttachmentList ;
    }

    
   
   public class sfdcDocument
   {
        public string Description { get; set; }
        public string Keywords { get; set; }
        public string FolderId { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string Body { get; set; }
   }

}