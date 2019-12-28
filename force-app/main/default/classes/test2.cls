public class test2 {

  public test2(){
   List <User> usr = [select id, name, CommunityNickname, IsPortalEnabled from User ];
 /* where id = : UserInfo.getUserId()*/
   // system.debug('--'+usr);
   for(User ur: usr){
     system.debug('--'+ur);
   }
   
  }
}