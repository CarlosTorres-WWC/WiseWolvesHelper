/*
 * @author: Carlos Torres.
 * @description: Invocable method to get the list of members on a queue to be use on 
 *      a custom notification or email action.
 */
public without sharing class QueueMemberHelper {
    @InvocableMethod(label='Get Query Queue Members')
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