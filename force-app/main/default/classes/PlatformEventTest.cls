@isTest
public class PlatformEventTest {
    
    @isTest
    static void test1(){
        Cloud_News__e event = new Cloud_News__e(Urgent__c = true, Location__c = 'Mountain City', News_Content__c = 'Test message');

        Test.startTest();
            Database.SaveResult sr = Eventbus.publish(event);
        Test.stopTest();

        System.assertEquals(true, sr.isSuccess());

        List<Case> csList = [Select Id From Case];

        System.assertEquals(1, csList.size());
    }
}
