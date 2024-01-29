/*
 * @author: Sebastian Torres.
 * @description: Helper Class to Map existing field values between two objects.
 */
public with sharing class ObjectClonerHelper {
    /*
     * Method to Map existing field values between two objects
     * @param input = Cgap SObject to set values to output
     * @param output = Work Order SObject to receive from input
 	*/
     public static SObject cloneFields(SObject input, SObject output) {  
        Schema.SObjectType workOrderType = Schema.getGlobalDescribe().get('WorkOrder');
        SObject outputResult =  workOrderType.newSObject();
        outputResult.put('Id',output.get('Id'));
        
          //Get objects to map fields
            Map<String, Schema.SObjectField> inputFieldMap = 
              Schema.getGlobalDescribe()
                              .get(input.getSObjectType().getDescribe().getName().toLowerCase())
                  .getDescribe().fields.getMap();
          Map<String, Schema.SObjectField> outputFieldMap = 
              Schema.getGlobalDescribe()
                  .get(output.getSObjectType().getDescribe().getName().toLowerCase())
                  .getDescribe().fields.getMap();
      
          for (String field : inputFieldMap.keySet()) {
              //Iteration cgap fields
              if(inputFieldMap.get(field) != null){
                  Schema.DescribeFieldResult fieldDescribe = inputFieldMap.get(field).getDescribe();
                  //Validation field is updatable and not autoNumber
                 if (fieldDescribe.isUpdateable() && !fieldDescribe.isAutoNumber() 
                     && !fieldDescribe.isCalculated() && fieldDescribe.isCustom() && field != 'Work_Order__c') {
                      //Validation WO field is not null
                      if (outputFieldMap.get(field) != null) {
                          Schema.DescribeFieldResult outFieldDescribe = outputFieldMap.get(field).getDescribe();
                          //Validation Cgap field & WO field are same type field
                          if (fieldDescribe.getType() == outFieldDescribe.getType()) {
                              //Validation fields exist in both objects
                              if (input.get(field) != null && outputFieldMap.containsKey(field) && field != null) {
                                  //Map values to output obj "Work Order"
                                  outputResult.put(field, input.get(field));
                              }
                          } else {
                              System.debug('Error: Data type doesn´t match with the other fields ' + field);
                          }
                          }
                  }  
              }
          }
      return outputResult;
    }  
}