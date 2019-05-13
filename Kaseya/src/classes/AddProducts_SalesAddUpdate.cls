public with sharing class AddProducts_SalesAddUpdate
 {

    public Decimal UnitPriceNewSS;
    public Decimal UnitPriceRenSS;
    public Decimal UnitPriceFstRenSS;

    public Decimal UnitPriceNewSP;
    public Decimal UnitPriceRenSP;
    public Decimal UnitPriceFstRenSP;
    
    public Decimal UnitPriceNewMnt;
    public Decimal UnitPriceRenMnt;
    public Decimal UnitPriceFstRenMnt;

    public Decimal UnitPriceNewSvs;
    public Decimal UnitPriceRenSvs;
    public Decimal UnitPriceFstRenSvs;

    public Decimal UnitPriceNewCon;
    public Decimal UnitPriceRenCon;
    public Decimal UnitPriceFstRenCon;

    private final OpportunityLineItem oli;
    private final Opportunity oppty;
    public String DealType;
//    public String Product2;
    public String ProdCat;
    public Id OpptyId;
    public String OpptyName;
    Public String opptycurr;

    public PricebookEntry Pricebook;
    public Product2 PlaceholderProds  ;
    Public Product2 PlaceholderProdsNames;
//    public OpportunityLineItem oliPrs;
    Set<Id> PRIDs = new Set<Id>();

//SS
   
   public Decimal getUnitPriceNewSS() {
      return UnitPriceNewSS;
   }

   public void setUnitPriceNewSS(Decimal  newss) {
      UnitPriceNewSS= newss;
   }
   public Decimal getUnitPriceRenSS() {
      return UnitPriceRenSS;
   }

   public void setUnitPriceRenSS(Decimal  renss) {
      UnitPriceRenSS= renss;
   }
   public Decimal getUnitPriceFstRenSS() {
      return UnitPriceFstRenSS;
   }

   public void setUnitPriceFstRenSS(Decimal  renss) {
      UnitPriceFstRenSS= renss;
   }
// SP
       public Decimal getUnitPriceNewSP() {
      return UnitPriceNewSP;
   }

   public void setUnitPriceNewSP(Decimal  newss) {
      UnitPriceNewSP= newss;
   }
   public Decimal getUnitPriceRenSP() {
      return UnitPriceRenSP;
   }

   public void setUnitPriceRenSP(Decimal  renss) {
      UnitPriceRenSP= renss;
   }
   public Decimal getUnitPriceFstRenSP() {
      return UnitPriceFstRenSP;
   }

   public void setUnitPriceFstRenSP(Decimal  renss) {
      UnitPriceFstRenSP= renss;
   }
//Svs

   public Decimal getUnitPriceNewSvs() {
      return UnitPriceNewSvs;
   }

   public void setUnitPriceNewSvs(Decimal  newss) {
      UnitPriceNewSvs= newss;
   }
   public Decimal getUnitPriceRenSvs() {
      return UnitPriceRenSvs;
   }

   public void setUnitPriceRenSvs(Decimal  renss) {
      UnitPriceRenSvs= renss;
   }
   public Decimal getUnitPriceFstRenSvs() {
      return UnitPriceFstRenSvs;
   }

   public void setUnitPriceFstRenSvs(Decimal  renss) {
      UnitPriceFstRenSvs= renss;
   }
//Con

   public Decimal getUnitPriceNewCon() {
      return UnitPriceNewCon;
   }

   public void setUnitPriceNewCon(Decimal  newss) {
      UnitPriceNewCon= newss;
   }
   public Decimal getUnitPriceRenCon() {
      return UnitPriceRenCon;
   }

   public void setUnitPriceRenCon(Decimal  renss) {
      UnitPriceRenCon= renss;
   }
   public Decimal getUnitPriceFstRenCon() {
      return UnitPriceFstRenCon;
   }

   public void setUnitPriceFstRenCon(Decimal  renss) {
      UnitPriceRenCon= renss;
   }
//Mnt
   public Decimal getUnitPriceNewMnt() {
      return UnitPriceNewMnt;
   }

   public void setUnitPriceNewMnt(Decimal  newss) {
      UnitPriceNewMnt= newss;
   }
   public Decimal getUnitPriceRenMnt() {
      return UnitPriceRenMnt;
   }

   public void setUnitPriceRenMnt(Decimal  renss) {
      UnitPriceRenMnt= renss;
   }
   public Decimal getUnitPriceFstRenMnt() {
      return UnitPriceFstRenMnt;
   }

   public void setUnitPriceFstRenMnt(Decimal  renss) {
      UnitPriceFstRenMnt= renss;
   }
 
   public String getOpptyName() {
       OpptyName = oppty.Name;
        return OpptyName ;
    }
// Add Prs
   
    public AddProducts_SalesAddUpdate () {
    OpptyId = ApexPages.currentPage().getParameters().get('oppid');
    oppty = [select id, name ,CurrencyIsoCode from Opportunity where id =
    :ApexPages.currentPage().getParameters().get('oppid')];
    if (oppty <> null) 
        opptycurr = oppty.CurrencyIsoCode;
        
    Product2[] Prs = new Product2[0];
//    PlaceholderProdsNames = 
    Prs = [select id,name from Product2 pp where Product2.name like 'Placeholder%'];
                
    OpportunityLineItem[] oliPrs = new OpportunityLineItem[0];
    oliPrs = [Select id,UnitPrice,Product__c,Deal_Type__c from OpportunityLineItem where OpportunityId =:OpptyId and Product__c in (Select id from Product2 where name like 'Placeholder%' and isActive = True 
        )and CurrencyIsoCode  = :opptycurr];

    system.debug(Prs);       
    system.debug(oliPrs);

     for (OpportunityLineItem PHPrs :oliPrs)
        {
        for (Product2 PHNames:Prs)
            { 
             if ((PHPrs.Product__c == PHNames.Id) && (PHNames.Name == 'Placeholder - Software-Subs Product') && (PHPrs.Deal_Type__c == 'New'))
                 UnitPriceNewSS=PHPrs.UnitPrice;      
             if ((PHPrs.Product__c == PHNames.Id) && (PHNames.Name == 'Placeholder - Software-Subs Product') && (PHPrs.Deal_Type__c == 'Renewal'))
                 UnitPriceRenSS=PHPrs.UnitPrice;      
             if ((PHPrs.Product__c == PHNames.Id) && (PHNames.Name == 'Placeholder - Maintenance Product'))
                 UnitPriceRenMnt=PHPrs.UnitPrice;      
             if ((PHPrs.Product__c == PHNames.Id) && (PHNames.Name == ' Placeholder - Services Product'))
                 UnitPriceNewSvs=PHPrs.UnitPrice;      
             if ((PHPrs.Product__c == PHNames.Id) && (PHNames.Name == 'Placeholder - Software-Perp Product'))
                 UnitPriceNewSP=PHPrs.UnitPrice;      
             if ((PHPrs.Product__c == PHNames.Id) && (PHNames.Name =='Placeholder - Content Product') && (PHPrs.Deal_Type__c == 'New'))
                 UnitPriceNewCon=PHPrs.UnitPrice;
             if ((PHPrs.Product__c == PHNames.Id) && (PHNames.Name =='Placeholder - Content Product') && (PHPrs.Deal_Type__c == 'Renewal'))
                 UnitPriceRenCon=PHPrs.UnitPrice;
           }
         }
         
     }



    public PageReference newsavelist(){
    
    OpportunityLineItem[] newoli = new List<OpportunityLineItem>();
    OpportunityLineItem[] oldOlis = new OpportunityLineItem[0];
    oldOlis = [Select id,UnitPrice,Product__c,Deal_Type__c from OpportunityLineItem where OpportunityId =:OpptyId and Product__c in (Select id from Product2 where name like 'Placeholder%' and isActive = True 
        )and CurrencyIsoCode  = :opptycurr];

// SS
    PlaceholderProds = 
    [select id,name from Product2 pp where Product2.Name like 'Placeholder%Software-Subs%'];
    
    
    Pricebook = [select id, Product2Id,CurrencyIsoCode , ProductCode from PricebookEntry 
        where Product2Id in (select id from Product2 where name = :PlaceholderProds.name  and isActive = True 
        )and CurrencyIsoCode  = :oppty.CurrencyIsoCode  ];

    if(UnitPriceNewSS <> 0)
    newoli.add(new OpportunityLineItem(UnitPrice = UnitPriceNewSS, Deal_Type__c= 'New',Quantity = 1, PricebookEntryId = Pricebook.Id,Product__c=Pricebook.Product2Id,OpportunityId = oppty.id));
     
    if(UnitPriceRenSS <> 0)
    newoli.add(new OpportunityLineItem(UnitPrice = UnitPriceRenSS, Deal_Type__c= 'Renewal',Quantity = 1, PricebookEntryId = Pricebook.Id,Product__c=Pricebook.Product2Id,OpportunityId = oppty.id));
    
//SP

    PlaceholderProds = 
    [select id,name from Product2 pp where Product2.Name like 'Placeholder%Software-Perp%'];
    
    
    Pricebook = [select id, Product2Id,CurrencyIsoCode , ProductCode from PricebookEntry 
        where Product2Id in (select id from Product2 where name = :PlaceholderProds.name  and isActive = True 
        )and CurrencyIsoCode  = :oppty.CurrencyIsoCode  ];

    if(UnitPriceNewSP <> 0)
    newoli.add(new OpportunityLineItem(UnitPrice = UnitPriceNewSP, Deal_Type__c= 'New',Quantity = 1, PricebookEntryId = Pricebook.Id,Product__c=Pricebook.Product2Id,OpportunityId = oppty.id));
    
//Mnt

    PlaceholderProds = 
    [select id,name from Product2 pp where Product2.Name like 'Placeholder%Maintenance%'];
    
    
    Pricebook = [select id, Product2Id,CurrencyIsoCode , ProductCode from PricebookEntry 
        where Product2Id in (select id from Product2 where name = :PlaceholderProds.name  and isActive = True 
        )and CurrencyIsoCode  = :oppty.CurrencyIsoCode  ];

    if(UnitPriceRenMnt <> 0)
    newoli.add(new OpportunityLineItem(UnitPrice = UnitPriceRenMnt , Deal_Type__c= 'Renewal',Quantity = 1, PricebookEntryId = Pricebook.Id,Product__c=Pricebook.Product2Id,OpportunityId = oppty.id));

    if(UnitPriceFstRenMnt <> 0)
    newoli.add(new OpportunityLineItem(UnitPrice = UnitPriceFstRenMnt , Deal_Type__c= '1st Year Renewal',Quantity = 1, PricebookEntryId = Pricebook.Id,Product__c=Pricebook.Product2Id,OpportunityId = oppty.id));
        
//Svs

    PlaceholderProds = 
    [select id,name from Product2 pp where Product2.Name like 'Placeholder%Services%'];
    
    
    Pricebook = [select id, Product2Id,CurrencyIsoCode , ProductCode from PricebookEntry 
        where Product2Id in (select id from Product2 where name = :PlaceholderProds.name  and isActive = True 
        )and CurrencyIsoCode  = :oppty.CurrencyIsoCode  ];

    if(UnitPriceNewSvs <> 0)
    newoli.add(new OpportunityLineItem(UnitPrice = UnitPriceNewSvs , Deal_Type__c= 'New',Quantity = 1, PricebookEntryId = Pricebook.Id,Product__c=Pricebook.Product2Id,OpportunityId = oppty.id));

// Content
    PlaceholderProds = 
    [select id,name from Product2 pp where Product2.Name like 'Placeholder%Content%'];
    
    
    Pricebook = [select id, Product2Id,CurrencyIsoCode , ProductCode from PricebookEntry 
        where Product2Id in (select id from Product2 where name = :PlaceholderProds.name  and isActive = True 
        )and CurrencyIsoCode  = :oppty.CurrencyIsoCode  ];

    if(UnitPriceNewCon <> 0)
    newoli.add(new OpportunityLineItem(UnitPrice = UnitPriceNewCon , Deal_Type__c= 'New',Quantity = 1, PricebookEntryId = Pricebook.Id,Product__c=Pricebook.Product2Id,OpportunityId = oppty.id));
     
    if(UnitPriceRenCon <> 0)
    newoli.add(new OpportunityLineItem(UnitPrice = UnitPriceRenCon, Deal_Type__c= 'Renewal',Quantity = 1, PricebookEntryId = Pricebook.Id,Product__c=Pricebook.Product2Id,OpportunityId = oppty.id));
                
    System.debug(newoli);
    upsert newoli;
    PageReference pr = new PageReference('/' + OpptyId);  
    pr.setRedirect(true);
    return pr;


    }
        public PageReference newcancel() {

        PageReference pr = new PageReference('/' + OpptyId);  
        system.debug('page refr is ' + pr);
        pr.setRedirect(true);
        return pr;

    }

}