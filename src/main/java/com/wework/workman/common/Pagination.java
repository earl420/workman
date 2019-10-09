package com.wework.workman.common;

public class Pagination {
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		int pageLimit =10;
		int boardLimit = 10;
		int maxPage = (listCount-1)/boardLimit+1;
		int startPage = (currentPage-1)/pageLimit *pageLimit +1;
		int endPage = startPage +pageLimit-1;
		if(endPage>maxPage) {
			endPage=maxPage;
		}
		
		PageInfo p =new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		
		return p;
	}
}
