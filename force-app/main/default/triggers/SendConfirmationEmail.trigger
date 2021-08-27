trigger SendConfirmationEmail on Session_Speaker__c (after insert) {

     for (Session_Speaker__c newItem : trigger.new){
         Session_Speaker__c sessionSpeaker=
         [select session__r.Name,
         Speaker__r.First_Name__c,
         Speaker__r.Email__C ,
         session__r.Session_Date__c From Session_Speaker__c where id = :newItem.id];
         If(sessionSpeaker.Speaker__r.Email__c != null){

            String address= sessionSpeaker.Speaker__r.Email__C;
            String subject = 'Session Confrimation';
            String body = 'Dear ' + sessionSpeaker.Speaker__r.First_Name__c

            + ',\n Your session "' + sessionSpeaker.session__r.Name +'"on' + 
            sessionSpeaker.session__r.Session_Date__c+ 'is Confirmed. \n\n' +
            'Thanks for Speaking at the Confference!';
         EmailManager.sendMail(address, subject, body);
         }
     }
    
    }