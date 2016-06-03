public with sharing class templateData {

public static String parseJSONString() {
 
 
 
 StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'SAMPLE' LIMIT 1];
String body = sr.Body.toString();
    
    
    map<String,String> mapAPIName=new map<String,String>();
 for(FieldTypeDetails__mdt mappedColumn1 : [select CSVColumnName__c,ColumnAPIName__c from FieldTypeDetails__mdt]){
                mapAPIName.put(mappedColumn1.ColumnAPIName__c.trim(), mappedColumn1.CSVColumnName__c.trim());
         }
 
       String jsonStr= '{"templateData":[' +
        '{"type_x":"","label":"abc__c","fullName":"","required":"true","length":"12"},' +
        '{"type_x":"Text","label":"abc__c","fullName":"testda","required":"false","length":"20"}' +
        ']}';

string xlsString ='';
string xlsString1 = mapAPIName.get('fullName')
+'\\t'+mapAPIName.get('label')
+'\\t'+mapAPIName.get('length')
+'\\t'+mapAPIName.get('required')
+'\\t'+mapAPIName.get('type_x')
+'\\t'+mapAPIName.get('inlineHelpText')
+'\\t'+mapAPIName.get('externalId')
+'\\t'+mapAPIName.get('description')
+'\\t'+mapAPIName.get('defaultValue')
+'\\t'+mapAPIName.get('PicklistValue')
+'\\t'+mapAPIName.get('referenceTo')
+'\\t'+mapAPIName.get('relationshipName')
+'\\t'+mapAPIName.get('sorted')
+'\\t'+mapAPIName.get('unique')
+'\\t'+mapAPIName.get('summarizedField')
+'\\t'+mapAPIName.get('summaryForeignKey')
+'\\t'+mapAPIName.get('summaryOperation')
+'\\t'+mapAPIName.get('displayFormat')
+'\\t'+mapAPIName.get('scale')
+'\\t'+mapAPIName.get('visibleLines')+'\\n';
//string xlsString1 ='fullname,label,length,required,type__x\n';
    // Parse entire JSON response.
    JSONParser parser = JSON.createParser(body);
    while (parser.nextToken() != null) {
        // Start at the array of template.
        if (parser.getCurrentToken() == JSONToken.START_ARRAY) {
            while (parser.nextToken() != null) {
                // Advance to the start object marker to
                //  find next row statement object.
                if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                    SchemaAttribute inv = (SchemaAttribute)parser.readValueAs(SchemaAttribute.class);
                    
                    //xlsString +=string.valueOf(inv) ;
                    
                    xlsString1 += inv.fullName+'\\t';
                    xlsString1 += inv.label+'\\t';
                    xlsString1 += inv.length+'\\t';
                    xlsString1 += inv.required+'\\t';
                    xlsString1 += inv.type_x+'\\t';
                    xlsString1 +=inv.inlineHelpText+'\\t';
                    xlsString1 +=inv.externalId+'\\t';
                    xlsString1 +=inv.description+'\\t';
                    xlsString1 +=inv.defaultValue+'\\t';
                    xlsString1 +=inv.PicklistValue+'\\t';
                    xlsString1 +=inv.referenceTo+'\\t';
                    xlsString1 +=inv.relationshipName+'\\t';
                    xlsString1 +=inv.sorted+'\\t';
                    xlsString1 +=inv.unique+'\\t';
                    xlsString1 +=inv.summarizedField+'\\t';
                    xlsString1 +=inv.summaryForeignKey+'\\t';
                    xlsString1 +=inv.summaryOperation+'\\t';
                    xlsString1 +=inv.displayFormat+'\\t';
                    xlsString1 +=inv.scale+'\\t';
                    xlsString1 +=inv.visibleLines+'\\n';
                        
                        
                   // system.debug('Field Type: ' + inv.FieldType);
                   // system.debug('decimal : ' + inv.decimalN);   
                   // String s = JSON.serialize(inv);
                    //system.debug('Serialized invoice: ' + s);

                    // Skip the child start array and start object markers.
                    parser.skipChildren();
                }
            }
        }
    }
    system.debug('value of xls 1 string'+xlsString1);
    system.debug('value of xls string'+xlsString);
    return xlsString1;
} 
}
// Inner classes used for serialization by readValuesAs().