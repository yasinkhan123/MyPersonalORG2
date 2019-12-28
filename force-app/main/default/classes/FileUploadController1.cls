public class FileUploadController1 {
    public Document document {
    get {
      if (document == null)
        document = new Document();
      return document;
    }
    set;
  } 

  public PageReference upload() {  
    Blob b;       
    b = document.Body;       
    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'File uploaded successfully : '+b));
    String communityId = null;
    String userId= UserInfo.getUserId();
   
    // Set photo
    ConnectApi.Photo photo = ConnectApi.ChatterUsers.setPhoto(communityId, userId,  new ConnectApi.BinaryInput(b,'image/jpg','userImage.jpg'));
    return null;
  }
 
}