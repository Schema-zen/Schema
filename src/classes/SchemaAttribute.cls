public class SchemaAttribute {
    /*public Double totalPrice;
    public DateTime statementDate;
    public Long invoiceNumber;
    public List<LineItem> lineItems;
    */
    
    // '{"FieldType":"Text","FieldApiName":"EmpName__C","Lengtha":20,"decimalN":10,"ProductName":"Pencil"}'']}';
     
    public string defaultValue;
    public string description;
    public string externalId;
    public string fullName;
    public string label;
    public string type_x;
    public string InlineHelpText;
    public string length;
    public string PicklistValue;
    public string referenceTo;
    public string relationshipName;
    public string required;
    public string scale;
    public string sorted;
    public string unique;
    public string visibleLines;
    public string summarizedField;
    public string summaryForeignKey;
    public string summaryOperation;
    public string displayFormat;
    
    public SchemaAttribute(String displayFormat,String summaryOperation,String summaryForeignKey,String summarizedField,string visibleLines,string unique,string sorted,string scale,string relationshipName,string referenceTo,string PicklistValue,string defaultValue,string description,string externalId,string type_x,string label,string fullName,string required,string length,string InlineHelpText ) {
     
        summarizedField=summarizedField;
        summaryForeignKey=summaryForeignKey;
        summaryOperation=summaryOperation;
        displayFormat=displayFormat;
        InlineHelpText=InlineHelpText;
        externalId=externalId;
        description=description;
        defaultValue=defaultValue;
        PicklistValue=PicklistValue;
        referenceTo=referenceTo;
        relationshipName=relationshipName;
        sorted=sorted;
        unique=unique;
        visibleLines=visibleLines;
        type_x=type_x;
        label=label;
        fullName=fullName;
        required = required;
        length = length;
        scale=scale;
    }
}