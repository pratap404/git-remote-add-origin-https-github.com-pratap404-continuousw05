trigger updateoppusingacc on Account (after update) {
account acc1=trigger.new[0];
account acc2=trigger.old[0];
      if(acc1.AccountNumber!=acc2.AccountNumber){
                  List <opportunity> op=[select id,name,description from opportunity where AccountId=:acc1.Id];
         		List <opportunity> opplist=  new List<opportunity>();
          for(opportunity opp: op){
          opp.AccountId=acc1.Id;
          opp.Description=acc1.AccountNumber;
          opplist.add(opp);
          }
          update opplist;
    }
}