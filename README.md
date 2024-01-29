
 <img width="100%" alt="Wisewolves" src="https://github.com/CarlosTorres-WWC/WiseWolvesHelper/assets/78768243/05d9f923-a772-4aa1-ba80-a86faf60aef0">


# Wise Wolves Helper Repository

## Trigger Framework
Lightweight trigger framework that helps organize Apex triggers and Improves Code Reusability in Salesforce and separates the logic of the Apex trigger into helper classes for easier maintenance and controlled changes in an orderly manner.

[TriggerHelper](https://github.com/CarlosTorres-WWC/WiseWolvesHelper/blob/main/WiseWolvesHelper/force-app/main/default/classes/TriggerHelper.cls)

[ServiceAppointmentTrigger](https://github.com/CarlosTorres-WWC/WiseWolvesHelper/blob/main/WiseWolvesHelper/force-app/main/default/triggers/ServiceAppointmentTrigger.trigger)

[ServiceAppoinmentTriggerHelper](https://github.com/CarlosTorres-WWC/WiseWolvesHelper/blob/main/WiseWolvesHelper/force-app/main/default/classes/ServiceAppointmentTriggerHelper.cls)


## Error Log Helper Class
This class provides you methods to log the exceptions on a custom object where we can track them with details and link the log to a record, validate DML Operations to log the failed records.

[ErrorHelper](https://github.com/CarlosTorres-WWC/WiseWolvesHelper/blob/main/WiseWolvesHelper/force-app/main/default/classes/ErrorHelper.cls)

## Get QueueMembers userIds
Invocable method that can be deployed to a salesforce organization and implemented on an screen flow where we need to query for the queue members to use them in order to send emails/notification from the Screen Flow.

[QueueMemberHelper](https://github.com/CarlosTorres-WWC/WiseWolvesHelper/blob/main/WiseWolvesHelper/force-app/main/default/classes/QueueMemberHelper.cls)

[QueueMemberHelperTest](https://github.com/CarlosTorres-WWC/WiseWolvesHelper/blob/main/WiseWolvesHelper/force-app/main/default/classes/QueueMemberHelperTest.cls)

## Send Email by an apex action.
Invocable method that can be deployed to allow the users to send an email with more than 5 recipients from a flow.

[EmailHelper](https://github.com/CarlosTorres-WWC/WiseWolvesHelper/blob/main/WiseWolvesHelper/force-app/main/default/classes/EmailHelper.cls)


## Apex Object Cloner
Helper class that allows to map objects that need to be synced on fields with the same data type and name, this can be linked by a lookup field and implemented on an apex trigger or as an invocable method.

[ObjectClonerHelper](https://github.com/CarlosTorres-WWC/WiseWolvesHelper/blob/main/WiseWolvesHelper/force-app/main/default/classes/DocusignHelper.cls)


## Docusign Helper Send an envelope By Apex Toolkit
Helper class to send an evenlope with documents and recipients, this method allows to query documents from different records and send them together on the same envelope.

[Docusign Helper](https://github.com/CarlosTorres-WWC/WiseWolvesHelper/blob/main/WiseWolvesHelper/force-app/main/default/classes/ObjectClonerHelper.cls)


