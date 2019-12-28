public class UPC_A_BarcodePageBeta2 {

   public UPC_A_BarcodePageBeta2(){
      DrawHTMLBarcode_UPCA('012345678912','yes','in',0,3,1,'bottom','center','','black','white');
   }
   
   public String DrawHTMLBarcode_UPCA(String data, String humanReadable, String units, Integer minBarWidth, Double width,Integer height, String textLocation,String textAlignment,
               String textStyle,String foreColor, String backColor){
      return DrawBarcode_UPCA(data, humanReadable, units, minBarWidth, width, height, textLocation, textAlignment, textStyle, foreColor,  backColor,'html');
   }
   
   public String DrawBarcode_UPCA(String data, String humanReadable, String units, Integer minBarWidth, Double width,Integer height, String textLocation,String textAlignment,
               String textStyle,String foreColor, String backColor,String mode){
               
     if (foreColor == '')
        foreColor='black';
        if (backColor == '')
        backColor='white';
        if (textLocation == '')
        textLocation='bottom';
        else if (textLocation != 'bottom' && textLocation != 'top')
        textLocation='bottom';
        if (textAlignment == '')
        textAlignment='center';
        else if (textAlignment != 'center' && textAlignment != 'left' && textAlignment != 'right')
        textAlignment='center';
        if (textStyle == '')
        textStyle='';
        if (height == 0)
        height=1;
        else if (height <= 0 || height > 15)
        height=1;
        if (width == 0)
        width=3;
        else if (width <= 0 || width > 15)
        width=3;
        if (minBarWidth == 0)
            minBarWidth=0;
        else if (minBarWidth < 0 || minBarWidth > 2)
            minBarWidth=0;
        if (units == '')
        units='in';
        else if (units != 'in' && units != 'cm')
        units='in';
        if (humanReadable =='')
        humanReadable='yes';
        else if (humanReadable != 'yes' && humanReadable != 'no')
        humanReadable='yes';
        
                    String encodedData = EncodeUPCA(data); 
                    String humanReadableText = ''; //Get_Human_Text(data);
                    Integer encodedLength = 0;
                    Integer thinLength = 0;
                    Double thickLength = 0.0;
                    Double totalLength = 0.0;
                    Double incrementWidth = 0.0;
                    Integer swing = 1;
                    String result = '';
                    Double barWidth = 0;
                    Double thickWidth = 0.0;
                    String svg;
                    
                    encodedLength = encodedData.length();
                    totalLength=encodedLength;
  
                    if (minBarWidth > 0)
                    {
                        barWidth = Double.valueof(String.valueof(minBarWidth).substring(2));
                        width = barWidth * totalLength;
                    }
                    else
                        barWidth = Double.valueof(String.valueof((width / totalLength)).substring(2));            
     return '012345678912';
   }
   
   public String EncodeUPCA(String data){
       /* var fontOutput = ConnectCode_Encode_UPCA(data, 0);
            var output = "";
            var pattern = "";
            for (x = 0; x < fontOutput.length; x++)
            {
                switch ((fontOutput.substr(x,1).charCodeAt(0)))
                {
                    //Separator
                    case 45:
                        pattern = "wbwbw";
                        break;

                    //Left ODD
                    case 48:
                        pattern = "wwwbbwb";
                        break;
                    case 49:
                        pattern = "wwbbwwb";
                        break;
                    case 50:
                        pattern = "wwbwwbb";
                        break;
                    case 51:
                        pattern = "wbbbbwb";
                        break;
                    case 52:
                        pattern = "wbwwwbb";
                        break;
                    case 53:
                        pattern = "wbbwwwb";
                        break;
                    case 54:
                        pattern = "wbwbbbb";
                        break;
                    case 55:
                        pattern = "wbbbwbb";
                        break;
                    case 56:
                        pattern = "wbbwbbb";
                        break;
                    case 57:
                        pattern = "wwwbwbb";
                        break;

                    //Right
                    case 111:
                        pattern = "wbwwbbb";
                        break;
                    case 112:
                        pattern = "wbbwwbb";
                        break;
                    case 113:
                        pattern = "wwbbwbb";
                        break;
                    case 114:
                        pattern = "wbwwwwb";
                        break;
                    case 115:
                        pattern = "wwbbbwb";
                        break;
                    case 116:
                        pattern = "wbbbwwb";
                        break;
                    case 117:
                        pattern = "wwwwbwb";
                        break;
                    case 118:
                        pattern = "wwbwwwb";
                        break;
                    case 119:
                        pattern = "wwwbwwb";
                        break;
                    case 120:
                        pattern = "wwbwbbb";
                        break;

                    //Right
                    case 97:
                        pattern = "bbbwwbw";
                        break;
                    case 98:
                        pattern = "bbwwbbw";
                        break;
                    case 99:
                        pattern = "bbwbbww";
                        break;
                    case 100:
                        pattern = "bwwwwbw";
                        break;
                    case 101:
                        pattern = "bwbbbww";
                        break;
                    case 102:
                        pattern = "bwwbbbw";
                        break;
                    case 103:
                        pattern = "bwbwwww";
                        break;
                    case 104:
                        pattern = "bwwwbww";
                        break;
                    case 105:
                        pattern = "bwwbwww";
                        break;
                    case 106:
                        pattern = "bbbwbww";
                        break;

                    case 91 : //Start 
                             pattern="bwb";
                             break;
                    case 93: //Stop
                             pattern = "bwb";
                             break;
                }
                output=output+pattern;
            } */
            String output = '123';
            return output;             
   }
   
   /* public String Get_Human_Text(String data){
                   String cd = "";
                   String Result = "";
                   String filtereddata = filterInput(data);

                   filteredlength = filtereddata.length;
               
                   if (filteredlength > 11) 
                   {
                       filtereddata = filtereddata.substr(0, 11);
                   }
               
                   if (filteredlength < 11) 
                   {
                       addcharlength = 11 - filtereddata.length;
                       for (x = 0;x<addcharlength;x++)
                       {
                           filtereddata = "0" + filtereddata
                       }
                   }
               
                   cd = generateCheckDigit(filtereddata);
               
                   filtereddata = filtereddata + cd;    
                   Result=filtereddata;
                   Result=html_decode(html_escape(Result));  
                   return Result;
        } */
    
   /* public html_decode(str) {
      String ta = 'document.createElement("textarea")';
          ta.innerHTML = str.replace(/</g,"&lt;").replace(/>/g,"&gt;");
          return ta.value;
    }  */
}