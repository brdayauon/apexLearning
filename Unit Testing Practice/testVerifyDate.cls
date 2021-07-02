@isTest
private class TestVerifyDate { 
    @isTest static void date2Within30Daysdate1(){
        Date returnDate1 = VerifyDate.CheckDates(date.valueOf('2021-07-01'), date.valueOf('2021-07-03'));
        
        //should return second date july 3
        System.assertEquals(date.valueOf('2021-07-03'), returnDate1);
    }
    
    @isTest static void date2NOTWithin30Daysdate1(){
        Date returnDate2 = VerifyDate.CheckDates(date.valueOf('2021-07-01'), date.valueOf('2022-07-03'));
        
        //should return end of july date
        System.assertEquals(date.valueOf('2021-07-31'), returnDate2);
    }
    
    
}