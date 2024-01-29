/*
 * @author: Carlos Torres.
 * @description: Invocable method to get the list of queue members to be use on 
 *      a custom notification or email action from an screen flow.
 */
public without sharing class QueueMemberHelper {
    @InvocableMethod(label='Get Query Queue Members - QueueMemberHelper.cls')
    public static List<List<String>> getQueryQueueMembers(List<Id> queueId) {
        List<List<String>> result = new List<List<String>>();
        List<String> collectionRecipients = new List<String>();
        List<groupMember> members = new List<groupMember>();
        members = [SELECT Id,UserOrGroupId FROM groupMember
                   WHERE GroupId IN :queueId];
        FOR(groupMember record : members){
            collectionRecipients.add(record.UserOrGroupId);
        }
        for(string record : queueId){
            result.add(collectionRecipients);     
        }
        return result;
    }
}