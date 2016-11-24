trigger Updateoppusingacc2 on Account (after update) {  
for (Account acc : Trigger.new) {
    // Access the "old" record by its ID in Trigger.oldMap
    Account accold = Trigger.oldMap.get(acc.Id);    
        if(acc.Accountnumber!=accold.Accountnumber){
        List <opportunity> op=[select id,name,description from opportunity where AccountId=:acc.Id];
         		List <opportunity> opplist=  new List<opportunity>();
          for(opportunity opp: op){
          opp.AccountId=acc.Id;
          opp.Description=acc.AccountNumber;
          opplist.add(opp);
          }
          update opplist;
    }
        
}  
}