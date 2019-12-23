package kr.co.acorn.dto;

public class CrawlDto {
	private String date;
	private int open;
	private int high;
	private int low;
	private int close;
	private int volume;
	private int mkCap;
	public CrawlDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CrawlDto(String date, int open, int high, int low, int close, int volume, int mkCap) {
		super();
		this.date = date;
		this.open = open;
		this.high = high;
		this.low = low;
		this.close = close;
		this.volume = volume;
		this.mkCap = mkCap;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getOpen() {
		return open;
	}
	public void setOpen(int open) {
		this.open = open;
	}
	public int getHigh() {
		return high;
	}
	public void setHigh(int high) {
		this.high = high;
	}
	public int getLow() {
		return low;
	}
	public void setLow(int low) {
		this.low = low;
	}
	public int getClose() {
		return close;
	}
	public void setClose(int close) {
		this.close = close;
	}
	public int getVolume() {
		return volume;
	}
	public void setVolume(int volume) {
		this.volume = volume;
	}
	public int getMkCap() {
		return mkCap;
	}
	public void setMkCap(int mkCap) {
		this.mkCap = mkCap;
	}
	
	
}
