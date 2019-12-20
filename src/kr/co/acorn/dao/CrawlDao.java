package kr.co.acorn.dao;

public class CrawlDao {
	private static CrawlDao single;
	private CrawlDao() {}
	public static CrawlDao getInstace() {
		if(single == null) {
			single = new CrawlDao();
		}
		return single;
	}
	
	
}
