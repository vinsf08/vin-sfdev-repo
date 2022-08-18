trigger CloudNewsTrigger on Cloud_News__e (after insert) {

    List<Case> caseList = new List<Case>();

    Group queue = [Select Id From Group Where Type = 'Queue' And DeveloperName = 'Regional_Dispatch'];

    for(Cloud_News__e cloudNewsEvent: Trigger.new) {
        if(cloudNewsEvent.Urgent__c ) {
            Case cs = new Case();
            cs.priority = 'High';
            cs.subject = 'News team dispatch to ' + cloudNewsEvent.Location__c;
            cs.ownerId = queue.Id;
            caseList.add(cs);
        }
    }

    insert caseList;
}