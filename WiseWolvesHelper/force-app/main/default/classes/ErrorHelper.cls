/*
 * @author: Carlos Torres.
 * @description:
 */
public class ErrorHelper{

    public static void logException(String objectName,String recordId,String processName,String exceptionDetail,String exceptionMessage){
        Error_Log__c error = new Error_Log__c();
        error.Object__c = objectName;
        error.RecordId__c = recordId;
        error.Operation__c = processName;
        error.Exception_Detail__c = exceptionDetail;
        error.Exception_Message__c = exceptionMessage;
        INSERT error;
    }

    public static void throwException(String processName,String message){
        throw new Exception('Exception happend during ' + processName + ',' + message);
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
}