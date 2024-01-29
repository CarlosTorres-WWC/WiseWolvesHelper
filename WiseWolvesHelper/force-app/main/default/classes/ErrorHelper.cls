/**
 * @className: ServiceAppointmentTriggerHelper.
 * @testClass: ServiceAppointmentsTestClass.
 * @description: Trigger that calculates the start and end date time on the patient's timezone.
 * @author: Carlos Torres @wisewolves.
 * @date: Nov/15/2023.
*/
public class ErrorHelper{

    public static void logSingleException(String objectName,String recordId,String processName,String exceptionDetail,String exceptionMessage){
        Error_Log__c error = new Error_Log__c();
        error.Object__c = objectName;
        error.RecordId__c = recordId;
        error.Operation__c = processName;
        error.Exception_Detail__c = exceptionDetail;
        error.Exception_Message__c = exceptionMessage;
        INSERT error;
    }

    public static Error_Log__c logException(String objectName,String recordId,String processName,String exceptionDetail,String exceptionMessage){
        Error_Log__c error = new Error_Log__c();
        error.Object__c = objectName;
        error.RecordId__c = recordId;
        error.Operation__c = processName;
        error.Exception_Detail__c = exceptionDetail;
        error.Exception_Message__c = exceptionMessage;
        return error;
    }

    public static SObject logExceptionOnRecord(String recordId,String objectName,String fieldApiName,String log){
        Schema.SObjectType objectType = Schema.getGlobalDescribe().get(objectName);
        SObject record = objectType.newSObject();
        record.put('Id', recordId);
        record.put(fieldApiName, log);
        return record;
    }

    public static void logDmlExceptions(String objname, String processname, List<Database.SaveResult> listSaveResult){
        List<Error_Log__c> exclist = new List<Error_Log__c>();
        for(Database.SaveResult res : listSaveResult){
            if(!res.isSuccess()){
                Error_Log__c exc = new Error_Log__c();
                exc.Object__c = objname;
        		exc.Operation__c = processname;
                String excdetail;
                for(Database.Error err : res.getErrors()) {
                      excdetail += err.getStatusCode()+':'+err.getMessage(); 
                     System.debug('Error returned: ' + err.getStatusCode() +' - ' + err.getMessage());
                }
                String detail = new dmlException().getStackTraceString();
                exc.Exception_Detail__c =excdetail+detail ;
                exc.RecordId__c = res.getId();
                exclist.add(exc);
            }
        }
        if(exclist.size()>0){
            INSERT exclist;
        }
    }

    public static void throwException(String processName,String message){
        throw new Exception('Exception happend during ' + processName + ',' + message);
    }
}