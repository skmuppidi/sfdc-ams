public class WatchStockDatabase {

    public static String watchStockSelect = ' ID, Name, Symbol__c, CompanyName__c, PrevClose__c, DayRange__c, TradeClose__c, PercentChange__c, '
        					+ ' LastTradeDate__c, CashPerShare__c, Change__c, RSI__c, FTWRange__c, Buy__c' ;
    
    /* This method accepts a collection of watchStock records */
    public static List<Database.upsertResult> upsertWatchStock(List<WatchStock__c> watchStocks)  {        
        List<Database.upsertResult> uResults = Database.upsert(watchStocks,false);
        return uResults;
    }
    public static List<Database.upsertResult> upsertFDACalendar(List<FDACalendar__c> FDACalendarList)  {        
        List<Database.upsertResult> uResults = Database.upsert(FDACalendarList,false);
        return uResults;
    }
    public static List<Database.upsertResult> upsertHistory(List<History__c> historys)  {
        List<Database.upsertResult> uResults = Database.upsert(historys,false);
        return uResults;
    } 
    public static List<Database.upsertResult> upsertOversold(List<Oversold__c> oversoldList)  {
        List<Database.upsertResult> uResults = Database.upsert(oversoldList,false);
        return uResults;
    }
    public static List<Database.upsertResult> upsertAnalystRating(List<AnalystRating__c> analystRatings)  {
        List<Database.upsertResult> uResults = Database.upsert(analystRatings,false);
        return uResults;
    }
    public static List<Database.upsertResult> upsertMarketNews(List<MarketNews__c> marketNews)  {        
        List<Database.upsertResult> uResults = Database.upsert(marketNews,false);
        return uResults;
    }
    public static List<Database.upsertResult> upsertCompanies(List<Company__c> companies)  {        
        List<Database.upsertResult> uResults = Database.upsert(companies,false);
        return uResults;
    }
    public static List<Oversold__c> selectOversold()  {       
        List<Oversold__c> oversoldList = new List<Oversold__c>();
        String query = CommonUtility.getSelectColumns('Oversold__c') 
            	+ ' FROM Oversold__c ';
        try {
            oversoldList = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            system.debug('exception: ' + e);
        }
        return oversoldList;
    }
    public static List<MarketNews__c> selectMarketNews(String Symbol)  {       
        List<MarketNews__c> marketNews = new List<MarketNews__c>();
        String query = CommonUtility.getSelectColumns('MarketNews__c') 
            	+ ' FROM MarketNews__c WHERE Symbol__c = :Symbol ';
        try {
            marketNews = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            system.debug('exception: ' + e);
        }
        return marketNews;
    }
    
    public static List<MarketNews__c> selectMarketNewsByWSId(String Id)  {       
        List<MarketNews__c> marketNews = new List<MarketNews__c>();
        String query = CommonUtility.getSelectColumns('MarketNews__c') 
            	+ ' FROM MarketNews__c WHERE WatchStock__c = :Id ORDER BY NewsDate__c desc ';
        try {
            marketNews = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            system.debug('exception: ' + e);
        }
        return marketNews;
    }
    public static List<MarketNews__c> selectMSByWSIdDate(String Id, Date newsDate)  {       
        List<MarketNews__c> marketNews = new List<MarketNews__c>();
        String query = CommonUtility.getSelectColumns('MarketNews__c') 
            	+ ' FROM MarketNews__c WHERE WatchStock__c = :Id AND DAY_ONLY(NewsDate__c) = :newsDate ORDER BY NewsDate__c desc ';
        try {
            marketNews = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            system.debug('exception: ' + e);
        }
        return marketNews;
    }
    
    public static List<AnalystRating__c> selectAnalystRating(String Symbol)  {       
        List<AnalystRating__c> analystRatings = new List<AnalystRating__c>();
        String query = CommonUtility.getSelectColumns('AnalystRating__c') 
            	+ ' FROM AnalystRating__c WHERE Symbol__c = :Symbol ';
        try {
            analystRatings = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            system.debug('exception: ' + e);
        }
        return analystRatings;
    }
    
    public static List<AnalystRating__c> selectAnalystRatingById(String Id)  {       
        List<AnalystRating__c> analystRatings = new List<AnalystRating__c>();
        String query = CommonUtility.getSelectColumns('AnalystRating__c') 
            	+ ' FROM AnalystRating__c WHERE WatchStock__c = :Id ORDER BY RatingDate__c DESC';
        try {
            analystRatings = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            system.debug('exception: ' + e);
        }
        return analystRatings;
    }
    
    public static List<WatchStock__c> selectWatchStocksNoOrderBy()  {       
       List<WatchStock__c> watchStocks = new List<WatchStock__c>(); 
       String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c ';
       try {
           watchStocks = database.query(query);
       } catch (QueryException e){
           //perform exception handling
           //system.debug('exception: ' + e);
       }
       return watchStocks;
   }
    
   public static List<WatchStock__c> selectWatchStocks()  {       
       List<WatchStock__c> watchStocks = new List<WatchStock__c>(); 
       String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c ORDER BY PercentChange__c desc ';
       try {
           watchStocks = database.query(query);
       } catch (QueryException e){
           //perform exception handling
           //system.debug('exception: ' + e);
       }
       return watchStocks;
   }
    
    public static List<SNPFH__c> selectSNPFH()  {       
        List<SNPFH__c> snpfhList = new List<SNPFH__c>(); 
        String query = CommonUtility.getSelectColumns('SNPFH__c') + ' FROM SNPFH__c ';
        try {
            snpfhList = database.query(query);
        } catch (QueryException e){            
        }
        return snpfhList;
    }
    public static List<NASDAQ100__c> selectNASDAQOH()  {       
        List<NASDAQ100__c> nasdaqohList = new List<NASDAQ100__c>(); 
        String query = CommonUtility.getSelectColumns('NASDAQ100__c') + ' FROM NASDAQ100__c ';
        try {
            nasdaqohList = database.query(query);
        } catch (QueryException e){            
        }
        return nasdaqohList;
    }
   public static List<FDACalendar__c> selectFDACalendar()  {       
        List<FDACalendar__c> FDACalendarList = new List<FDACalendar__c>(); 
        String query = CommonUtility.getSelectColumns('FDACalendar__c') + ' FROM FDACalendar__c ORDER BY EventDate__c ';
        try {
            FDACalendarList = database.query(query);
        } catch (QueryException e){            
        }
        return FDACalendarList;
    }
    public static List<FDACalendar__c> selectActiveFDACalendar()  {       
        Datetime dt = System.now();
        Date d = dt.Date().addDays(-7);
        
        List<FDACalendar__c> FDACalendarList = new List<FDACalendar__c>(); 
        String query = CommonUtility.getSelectColumns('FDACalendar__c') + ' FROM FDACalendar__c WHERE EventDate__c >= :d ORDER BY EventDate__c ';
        try {
            FDACalendarList = database.query(query);
        } catch (QueryException e){            
        }
        return FDACalendarList;
    }
    public static List<FDACalendar__c> selectFDACalendarBySymbol(String symbol)  {       
        List<FDACalendar__c> FDACalendarList = new List<FDACalendar__c>(); 
        String query = CommonUtility.getSelectColumns('FDACalendar__c') + ' FROM FDACalendar__c Where Symbol__c = :symbol ';
        try {
            FDACalendarList = database.query(query);
        } catch (QueryException e){            
        }
        return FDACalendarList;
    }
    public static List<FDACalendar__c> selectFDACalendarByWSId(String wsId)  { 
        
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        watchStocks = selectWatchStocksById(wsId);
        string symbol = null;
        for (WatchStock__c watchStock : watchStocks) {
            symbol = watchStock.Symbol__c;
            break;
        }
        
        List<FDACalendar__c> FDACalendarList = new List<FDACalendar__c>(); 
        String query = CommonUtility.getSelectColumns('FDACalendar__c') + ' FROM FDACalendar__c WHERE WatchStock__c = :wsId OR Symbol__c = :symbol ORDER BY EventDate__c  ';
        try {
            FDACalendarList = database.query(query);
        } catch (QueryException e){            
        }
        return FDACalendarList;
    }
    
    public static List<FDACalendar__c> selectFDACalendarById(String Id)  { 
        
        List<FDACalendar__c> FDACalendarList = new List<FDACalendar__c>();
        String query = CommonUtility.getSelectColumns('FDACalendar__c') + ' FROM FDACalendar__c WHERE Id = :Id ';
        try {
            FDACalendarList = database.query(query);
        } 
        catch (QueryException e){            
        }
        string symbol = null;
        for (FDACalendar__c fdaCalendar : FDACalendarList) {
            symbol = fdaCalendar.Symbol__c;
            break;
        }
        
        FDACalendarList = new List<FDACalendar__c>(); 
        query = CommonUtility.getSelectColumns('FDACalendar__c') + ' FROM FDACalendar__c WHERE Id = :Id OR Symbol__c = :symbol ORDER BY EventDate__c  ';
        try {
            FDACalendarList = database.query(query);
        } catch (QueryException e){            
        }
        return FDACalendarList;
    }
    public static List<FDACalendar__c> selectFDANotifyCalendar()  {       
        List<FDACalendar__c> FDACalendarList = new List<FDACalendar__c>(); 
        String query = CommonUtility.getSelectColumns('FDACalendar__c') + ' FROM FDACalendar__c WHERE Notify__c = TRUE ';
        try {
            FDACalendarList = database.query(query);
        } catch (QueryException e){            
        }
        return FDACalendarList;
    }
    public static List<FDACalendar__c> selectFDAOverSoldCalendar()  {       
        List<FDACalendar__c> FDACalendarList = new List<FDACalendar__c>(); 
        String query = CommonUtility.getSelectColumns('FDACalendar__c') + ' FROM FDACalendar__c WHERE RSI__c <= 0 OR CNBCRSI__c <= 0 ';
        try {
            FDACalendarList = database.query(query);
        } catch (QueryException e){            
        }
        return FDACalendarList;
    }    
    
    public static List<FDACalendar__c> lowerLimitFDACalendar()  {       
        List<FDACalendar__c> FDACalendarList = new List<FDACalendar__c>(); 
        String query = CommonUtility.getSelectColumns('FDACalendar__c') + ' FROM FDACalendar__c WHERE LowerLimit__c != NULL AND Notify__c = True ';
        try {
            FDACalendarList = database.query(query);
        } catch (QueryException e){     
            System.debug('e : ' + e.getMessage());
        }
        return FDACalendarList;
    }
    public static List<FDACalendar__c> selectMyWatchFDACalendar()  {       
        List<FDACalendar__c> FDACalendarList = new List<FDACalendar__c>(); 
        String query = CommonUtility.getSelectColumns('FDACalendar__c') + ' FROM FDACalendar__c WHERE Stage__c Like \'%BLA%\' OR Stage__c Like \'%NDA%\' OR Stage__c Like \'%PDUFA%\' ORDER BY EventDate__c DESC  ';
        try {
            FDACalendarList = database.query(query);
        } catch (QueryException e){           
        }
        return FDACalendarList;
    }
    public static List<FDACalendar__c> selectReviewFDACalendar()  {       
        List<FDACalendar__c> FDACalendarList = new List<FDACalendar__c>(); 
        String query = CommonUtility.getSelectColumns('FDACalendar__c') + ' FROM FDACalendar__c WHERE Ignore__c = \'No\' AND (Stage__c Like \'%BLA%\' OR Stage__c Like \'%NDA%\' OR Stage__c Like \'%PDUFA%\') ORDER BY EventDate__c DESC  ';
        try {
            FDACalendarList = database.query(query);
        } catch (QueryException e){           
        }
        return FDACalendarList;
    }
    public static List<WatchStock__c> selectOverSoldStocks()  {       
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE RSI__c < 0 OR CNBCRSI__c < 0 ORDER BY RSI__c ';
        try {
            watchStocks = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            //system.debug('exception: ' + e);
        }
		return watchStocks ;        
    }
    public static List<WatchStock__c> selectMonitorStocks()  {       
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE Monitor__c = \'Yes\' ORDER BY PercentChange__c desc ';
        try {
            watchStocks = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            //system.debug('exception: ' + e);
        }        
        return watchStocks;
    }
    public static List<WatchStock__c> selectSNPStocks()  {       
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE SNPRank__c != NULL ORDER BY PercentChange__c desc ';
        try {
            watchStocks = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            //system.debug('exception: ' + e);
        }        
        return watchStocks;
    }
    public static List<WatchStock__c> selectSPACStocks()  {       
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE SPAC__c = \'Yes\' AND MergerComplete__c != \'Yes\' ORDER BY PercentChange__c desc ';
        try {
            watchStocks = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            //system.debug('exception: ' + e);
        }        
        return watchStocks;
    }
    public static List<WatchStock__c> selectMergerCompleteStocks()  {       
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE SPAC__c = \'Yes\' AND MergerComplete__c = \'Yes\' ORDER BY PercentChange__c desc ';
        try {
            watchStocks = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            //system.debug('exception: ' + e);
        }        
        return watchStocks;
    }
    public static List<WatchStock__c> selectNonSPACStocks()  {       
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE (SPAC__c = null OR SPAC__c = \'No\' OR MergerComplete__c = \'Yes\') ORDER BY PercentChange__c desc ';
        try {
            watchStocks = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            //system.debug('exception: ' + e);
        }        
        return watchStocks;
    }
    public static List<WatchStock__c> selectTop5SPACsByPercent()  {       
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE SPAC__c = \'Yes\' ORDER BY PercentChange__c desc LIMIT 5 ';
        try {
            watchStocks = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            //system.debug('exception: ' + e);
        }        
        return watchStocks;
    }
    public static List<WatchStock__c> selectTop5SPACsByVolume()  {       
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE SPAC__c = \'Yes\' ORDER BY Volume__c desc LIMIT 5 ';
        try {
            watchStocks = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            //system.debug('exception: ' + e);
        }        
        return watchStocks;
    }
    public static List<WatchStock__c> selectCloseToMergerSpacs()  {  
        
        Datetime dt = System.now();
        Date d = dt.Date();
        
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE SPAC__c = \'Yes\' AND MergerDate__c != NULL AND DAY_ONLY(MergerDate__c) >= :d ORDER BY MergerDate__c  LIMIT 5 ';
        system.debug('query: ' + query);
        try {
            watchStocks = database.query(query);
            system.debug('watchStocks.size(): ' + watchStocks.size());
        } catch (QueryException e){
            //perform exception handling
            //system.debug('exception: ' + e);
        }        
        return watchStocks;
    }
    public static List<WatchStock__c> selectBuyStocks()  {       
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE Buy__c = \'Yes\' ORDER BY PercentChange__c desc ';
        try {
            watchStocks = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            //system.debug('exception: ' + e);
        }        
        return watchStocks;
    }
    
    public static List<WatchStock__c> reachedLowerLimitWS()  {       
        List<WatchStock__c> watchStocks = new List<WatchStock__c>(); 
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE LowerLimit__c != NULL AND ReachedLowerLimit__c = True ';
        try {
            watchStocks = database.query(query);
        } catch (QueryException e){     
            System.debug('e : ' + e.getMessage());
        }
        return watchStocks;
    }
    
    public static List<WatchStock__c> selectWatchStocksByIds(List<Id> watchStockIds)  {       
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE Id IN :watchStockIds ';
        system.debug('query: ' + query);
        try {
            watchStocks = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            system.debug('exception: ' + e);
        }
        return watchStocks;
    }
    
    public static List<WatchStock__c> selectWatchStocks(String Symbol)  {       
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE Symbol__c = :Symbol ';
        try {
            watchStocks = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            system.debug('exception: ' + e);
        }
        return watchStocks;
    }
    public static List<WatchStock__c> selectWatchStocksById(String Id)  {       
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE Id = :Id ';
        try {
            watchStocks = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            system.debug('exception: ' + e);
        }
        return watchStocks;
    }
    public static List<WatchStock__c> selectMonitorWatchStocks()  {       
        List<WatchStock__c> watchStocks = new List<WatchStock__c>();
        String query = CommonUtility.getSelectColumns('WatchStock__c') + ' FROM WatchStock__c WHERE Monitor__c = \'Yes\' ';
        try {
            watchStocks = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            system.debug('exception: ' + e);
        }
        return watchStocks;
    }
    
    public static List<History__c> selectHistory(String Symbol)  {       
        List<History__c> historys = new List<History__c>();
        String query = CommonUtility.getSelectColumns('History__c') + ' FROM History__c WHERE Symbol__c = :Symbol ';
        try {
            historys = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            system.debug('exception: ' + e);
        }
        return historys;
    }
    public static List<History__c> selectHistory(List<Id> historyIds)  {       
        List<History__c> historys = new List<History__c>();
        String query = CommonUtility.getSelectColumns('History__c') + ' FROM History__c WHERE Id IN :historyIds ';
        try {
            historys = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            system.debug('exception: ' + e);
        }             
        return historys;
    }
    public static List<History__c> selectHistoryById(String Id)  {       
        List<History__c> historys = new List<History__c>();
        String query = CommonUtility.getSelectColumns('History__c') 
            	+ ' FROM History__c WHERE WatchStock__c = :Id ORDER BY TradeDate__c DESC ';
        try {
            historys = database.query(query);
        } catch (QueryException e){
            //perform exception handling
            system.debug('exception: ' + e);
        }
        return historys;
    }
}