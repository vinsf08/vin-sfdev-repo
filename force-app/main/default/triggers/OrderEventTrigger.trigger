trigger OrderEventTrigger on Order_Event__e (after insert) {

    List<Task> taskList = new List<Task>();

    for(Order_Event__e orderEvent: Trigger.new) {
        if(orderEvent.Has_Shipped__c) {
            Task t = new Task();
            t.Priority = 'Medium';
            t.Subject = 'Follow up on shipped order 105';
            t.OwnerId = orderEvent.createdById;

            taskList.add(t);
        }
    }

    insert taskList;
}