/**
 * @class: DocusignHelper.
 * @description: helper class to implement the Docusign APIToolkit to send envelope
 *  ,add attachments and recipient by apex.
 */
public with sharing class DocusignHelper {

    /**
     * @method: sendEnvelopeInFuture
     * @description: Allows to create 1 envelope with multiple documents from different objects 
     *  and sends them together.
     */
    @future(Callout = true)
	public static void sendEnvelopeInFuture(Id envelopeId){
        dfsle.Envelope myEnvelope = dfsle.EnvelopeService.getEmptyEnvelope(new dfsle.Entity(envelopeId));
        string contactId = getProviderId(envelopeId);
        Contact myContact = [SELECT Name, Email,Id, DocuSign_Email__c  
                             FROM Contact WHERE Id = :contactId LIMIT 1];
        //COMMENT: Builds the recipient.
        dfsle.Recipient myRecipient = dfsle.Recipient.fromSource(
          myContact.Name,
          myContact.DocuSign_Email__c, null,
          'Signer 1', new dfsle.Entity(myContact.Id)
        );
        //COMMENT: Adds the recipients to the envelope.
        myEnvelope = myEnvelope.withRecipients(new List<dfsle.Recipient> { myRecipient });
        //COMMENT: Queries for the documents to be attached on the envelope.
        List<contentDocumentLink> lstD = [SELECT Id,contentDocumentId FROM contentDocumentLink 
                                  WHERE LinkedEntityId = :envelopeId];
        Set<String> setContentDocument = New Set<String>();
        for(contentDocumentLink record: lstD){
            setContentDocument.add(record.contentDocumentId);
        }
        
        List<contentVersion> lstC = [SELECT Id,contentDocumentId FROM contentVersion 
                                          WHERE contentDocumentId IN :setContentDocument];
        Set<Id> sObjectIds = New Set<Id>();
        for(contentVersion rec : lstC){
            sObjectIds.add(rec.Id);
        }
        
        //COMMENT: Adds the documents to the envelope.
        list<dfsle.Document> docs2 = dfsle.DocumentService.getDocuments(
             ContentVersion.getSObjectType(),sObjectIds);
        
         myEnvelope = myEnvelope.withDocuments(docs2);

         //COMMENT: WRITE_BACK_ENVELOPE_STATUS_PDF.
         myEnvelope.withOptions(new dfsle.Envelope.Options(true,
         	new dfsle.Document.WriteBack(envelopeId,
            dfsle.Document.WRITE_BACK_ENVELOPE_STATUS_PDF,false,false),
            new Map<String, Map<String, Object>>(),
         new Map<String, Map<String, Object>>()));
        if(!test.isRunningTest()){
            myEnvelope = dfsle.EnvelopeService.sendEnvelope(
              myEnvelope,
              true
            );
        }  
        
        List<dfsle__Envelope__c> lstEnv = [SELECT Id,dfsle__DocuSignId__c FROM dfsle__Envelope__c 
                                           WHERE Id = :myEnvelope.Id];
        Envelope__c enveloperec = New Envelope__c();
        enveloperec.id = envelopeId;
        enveloperec.Status__c = 'Sent';
        enveloperec.Envelope_Id__c = (lstEnv != null && lstEnv.size() > 0) ? lstEnv.get(0).dfsle__DocuSignId__c : '' ;
        UPDATE enveloperec;
    }
    
    @Invocablemethod(label='Send Envelope with attachments')
    public static void createAndSendEnvelope(List<String> mySourceId) {
   		String envelopeId = mySourceId.get(0);
   	    sendEnvelopeInFuture(envelopeId);
    }
}