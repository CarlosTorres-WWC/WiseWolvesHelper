/**
 * @className: ServiceAppointmentTriggerHelper.
 * @testClass: ServiceAppointmentsTestClass.
 * @description: Trigger that calculates the start and end date time on the patient's timezone.
 * @author: Dev @wisewolves.
 * @date: Nov/15/2023.
*/
public WITHOUT SHARING class ServiceAppointmentTriggerHelper extends TriggerHelper{
    /**
    * @description: handles the trigger context for the process before update
	    here is where we add the filter to select the records will be working with.
	* @params: Trigger Context.
    */
    public override void processBeforeUpdate(){
        try{
            for(ServiceAppointment SA : (List<ServiceAppointment>)Trigger.New){
                ServiceAppointment oldSA = (ServiceAppointment)Trigger.oldMap.get(SA.id);
                if(!String.isEmpty(SA.Time_Zone__c) && SA.SchedStartTime != null && SA.SchedEndTime != null && 
                   ((SA.SchedStartTime != oldSA.SchedStartTime) || (SA.SchedEndTime != oldSA.SchedEndTime))){
                    SA.Start_DateTime__c = calculcateDateTime(SA.SchedStartTime,SA.Time_Zone__c);
                    SA.End_DateTime__c = calculcateDateTime(SA.SchedEndTime,SA.Time_Zone__c);
                }
            }
        }catch(Exception ex){
            ErrorHelper.logException('Serive Appointment', '', 'Appointment - processBeforeUpdate', String.valueOf(Trigger.New) , ex.getMessage());
            ErrorHelper.throwException('Appointment - processBeforeUpdate', ex.getMessage() + ':' + ex.getLineNumber());
        }
    }

   /**
     * @description: calculcateDateTime.
	   * @params: {DateTime} param,{String} timeZone.
    */
    public static String calculcateDateTime(DateTime param,String timeZone){
        
    }
}