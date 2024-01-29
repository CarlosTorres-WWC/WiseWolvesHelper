/*
 * @author: Carlos Torres.
 * @description: email helper class to allow users to send Emails to more than 5 recipients 
 *  and implementation from screen flow action.
 */
public class EmailHelper {
    @InvocableMethod(label='Send Email - Action' description='Send an email using the specified parameters')
    public static void sendEmail(List<EmailInput> emailInputs) {
        List<Messaging.SingleEmailMessage> lstEmails = new List<Messaging.SingleEmailMessage>();
            for(EmailInput record : emailInputs){
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setTargetObjectId(record.recordId);
                String Addresses = record.emailRecipients;
                Addresses = Addresses.substring(0, Addresses.length() - 1);
                String[] emailsAdd = Addresses.split(',');
                email.toAddresses = emailsAdd;
                email.setSubject(record.emailSubject);
                email.setHtmlBody(record.emailBody);
                email.setSaveAsActivity(true);
                lstEmails.add(email);
        }
        Messaging.sendEmail(lstEmails);
    }
    
    public class EmailInput {
        @InvocableVariable(label='Recipients')
        public String emailRecipients;
        @InvocableVariable(label='Email Subject')
        public String emailSubject;
        @InvocableVariable(label='Email Body')
        public String emailBody;
        @InvocableVariable(label='Record Ids')
        public Id recordId;
        }
    }