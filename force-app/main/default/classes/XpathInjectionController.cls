public class XpathInjectionController {

   

public List<Positions__C> pos     { get;  set; }
public List<Positions__C> posTemp { get;  set; }
public Integer counter            { get;  set; }
public Integer EscSequencecounter            { get;  set; }

  public XpathInjectionController(){
     pos = [Select Id, Status__c, Name From Positions__C Where Id =: 'a00i000000UIuKP'];
     posTemp = new List<Positions__C>();
  }
  
    public void Ldap1() {
         Decimal hoursVal = 5.66;
      if(hoursVal != null){
         system.debug('-- hoursVal'+hoursVal);
         String convertedVal = String.valueof(hoursVal);
         system.debug('-- convertedVal'+convertedVal);
         String s = '()=[]:,*/|&;';
          s =+ convertedVal; 
         String emailRegex = '\\(\\)\\=\\[\\]\\:\\,\\*\\/\\|';
         Pattern MyPattern = Pattern.compile(emailRegex);
         Matcher MyMatcher = MyPattern.matcher(s);
         convertedVal = String.escapeSingleQuotes(MyMatcher.replaceAll(''));
         convertedVal = convertedVal.replace('&','');
         convertedVal = convertedVal.replace(';','');
         convertedVal = String.escapeSingleQuotes(convertedVal);
         hoursVal = Decimal.valueof(convertedVal);
         system.debug('-- Decimal final hoursVal:'+hoursVal);
        } 
    } 

  
  public Void Ldap() {
      
      // if(hoursValue != null){
        
       
      
         String s = 'yasin()=[]:,*/|&;'; 
         String emailRegex = '\\(\\)\\=\\[\\]\\:\\,\\*\\/\\|';
         Pattern MyPattern = Pattern.compile(emailRegex);
         Matcher MyMatcher = MyPattern.matcher(s);
         String  convertedVal = String.escapeSingleQuotes(MyMatcher.replaceAll(''));
         convertedVal = convertedVal.replace('&','');
         convertedVal = convertedVal.replace(';','');
         convertedVal = convertedVal.replace('"','');
         convertedVal = String.escapeSingleQuotes(convertedVal);

        system.debug('value :'+convertedVal);
       // }
      // return convertedVal;
          
    }
    
  public void Save(){
           String s = 'email()=[]:,*/alert(1);{}';
          // String emailRegex = '\\(\\)\\=\\[\\]\\:\\,\\*\\/\\;\\|\\&\\"\\!\\(sn=*\\alert(1);';
           String emailRegex =  '\\(\\)\\=\\[\\]\\:\\,\\*';
                                
            Pattern MyPattern = Pattern.compile(emailRegex);
            Matcher MyMatcher = MyPattern.matcher(s);
        s = String.escapeSingleQuotes(MyMatcher.replaceAll(''));
            s = s.replace(';','');
             s = s.replace(')','');
              s = s.replace('(','');
              s = s.replace('{',''); 
               s = s.replace('}','');
              s = s.replace('alert1','');
        system.debug('-- final s:'+s);
       // Boolean result = MyMatcher.matches();

  }
  
  public void Save1() {
      for(Positions__c posCnt : pos ){
              String verifiedResultString  = posCnt.Name;
               
               verifiedResultString = String.escapeSingleQuotes(verifiedResultString); 
               String EscSequence = '()=[]:,*/';
               String []Tempchars = new String []{}; 
           
               String[] chars = verifiedResultString.split('');  
               String[] EscSequencechars = verifiedResultString.split('');
              
           
               counter = verifiedResultString.length()-2;                                                 
               EscSequencecounter = EscSequence.length()-2;          
                
               chars.remove(0);
               EscSequencechars.remove(0);
                            system.debug('-- chars'+chars); system.debug('-- EscSequencechars '+EscSequencechars);    
               for(Integer i=0,k=0;i<counter;i++) {
                   for(Integer j=0;j<EscSequencecounter;j++){
                     if((chars[i] != EscSequencechars[j] ) && (chars[i] != '\'' ) ){
                        Tempchars[i]=chars[i];
                        system.debug(chars[i]);
                        k++;
                     } 
                   }
               }
                
              // String.join(Tempchars, '');    
               posCnt.name = verifiedResultString;
               posTemp.add(posCnt);
                       System.debug('Let say Tempchars :'+Tempchars);
      }     
        //upsert pos;
        System.debug('-- posTemp'+posTemp);

    }

  
}