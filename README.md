![Banner](https://github.com/CarlosTorres-WWC/WiseWolvesHelper/assets/78768243/05d9f923-a772-4aa1-ba80-a86faf60aef0)
# Wise Wolves Helper Repository

this repository is a contribution from the wise wolves development team where you can find helper classes that can be implemented on any salesforce org.

https://wisewolves.com/

## Get QueueMembers userIds
### Description: 

Invocable method that can be deployed to a salesforce organization and implemented on an screen flow where we need to query for the queue members to use them in order to send emails/notification from the Screen Flow.
### Classes:
[QueueMemberHelper](https://github.com/CarlosTorres-WWC/WiseWolvesHelper/blob/main/WiseWolvesHelper/force-app/main/default/classes/QueueMemberHelper.cls)

[QueueMemberHelperTest](https://github.com/CarlosTorres-WWC/WiseWolvesHelper/blob/main/WiseWolvesHelper/force-app/main/default/classes/QueueMemberHelperTest.cls)

## Send Email by an apex action.
### Description:

Invocable method that can be deployed to allow the users to send an email with more than 5 recipients from a flow.
### Classes:
[EmailHelper](https://github.com/CarlosTorres-WWC/WiseWolvesHelper/blob/main/WiseWolvesHelper/force-app/main/default/classes/EmailHelper.cls)


## Object Cloner
### Description:

Helper class that allows to map objects that need to be synced on fields with the same data type and name, this can be linked by a lookup field and implemented on an apex trigger or as an invocable method.

### Classes:
[ObjectClonerHelper](https://github.com/CarlosTorres-WWC/WiseWolvesHelper/blob/main/WiseWolvesHelper/force-app/main/default/classes/ObjectClonerHelper.cls)


