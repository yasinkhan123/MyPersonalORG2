public class FutureClassLimitsTest {

    @future(callout=true)
    public static void docallouts(){

        for(Integer i=0;i<200;i++){
            Http http=new Http();
            HttpRequest hr=new HttpRequest();
            hr.setMethod('GET');
            hr.setEndpoint('https://th-apex-http-callout.herokuapp.com');
            http.send(hr);
        }


    }

}