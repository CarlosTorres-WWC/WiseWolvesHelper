@isTest(SeeAllData = true)
public class QueueMemberHelperTest {
    @isTest
    public static void getQueryQueueMembersTest(){
        List<Id> queueId = New List<Id>();
        List<Group> lstQueue = [SELECT Id FROM Group WHERE
                                   Name = 'Patient Request Queue'];
        queueId.add(lstQueue.get(0).id);
        NotificationHelper.queryQueueMembers(queueId);
    }
}    