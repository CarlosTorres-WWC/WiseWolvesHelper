/*
 * @author: Sebastian Torres.
 * @description: Helper Class to map field values between 2 objects, no matter if there are custom or standard
 *   you can use it with a invocable to set object values. Is used to update and set value from a object
 *  to other and work in sync, the info directional.
 */
public with sharing class ObjectClonerHelper {
    /*
     * Method to Map existing field values between two objects
     * @param input = Source SObject to set values to output.
     * @param output = Destination SObject to receive from input.
 	*/
     public static SObject cloneFields(SObject input, SObject output) {  
        Schema.SObjectType workOrderType = Schema.getGlobalDescribe().get('WorkOrder');
        SObject outputResult =  workOrderType.newSObject();
        outputResult.put('Id',output.get('Id'));
        Map<String, Schema.SObjectField> inputFieldMap = 
              Schema.getGlobalDescribe().get(input.getSObjectType().getDescribe().getName().toLowerCase())
                  .getDescribe().fields.getMap();
          Map<String, Schema.SObjectField> outputFieldMap = 
              Schema.getGlobalDescribe().get(output.getSObjectType().getDescribe().getName().toLowerCase())
                  .getDescribe().fields.getMap();
      
          for (String field : inputFieldMap.keySet()) {
              if(inputFieldMap.get(field) != null){
                  Schema.DescribeFieldResult fieldDescribe = inputFieldMap.get(field).getDescribe();
                 if (fieldDescribe.isUpdateable() && !fieldDescribe.isAutoNumber() 
                     && !fieldDescribe.isCalculated() && fieldDescribe.isCustom() && field != 'Work_Order__c') {
                      if (outputFieldMap.get(field) != null) {
                          Schema.DescribeFieldResult outFieldDescribe = outputFieldMap.get(field).getDescribe();
                          if (fieldDescribe.getType() == outFieldDescribe.getType()) {
                              if (input.get(field) != null && outputFieldMap.containsKey(field) && field != null) {
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