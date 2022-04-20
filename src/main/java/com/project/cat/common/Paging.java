package com.project.cat.common;

public class Paging {
	private int startRow;
	private int endRow;
	private String keyword;
	
	public Paging() {}

	public Paging(int startRow, int endRow) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
	}
	
	public Paging(int startRow, int endRow, String keyword) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.keyword = keyword;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public String getㅏeyword() {
		return keyword;
	}

	public void setㅏeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Paging [startRow=" + startRow + ", endRow=" + endRow + ", keyword=" + keyword + "]";
	}
	
	
}
