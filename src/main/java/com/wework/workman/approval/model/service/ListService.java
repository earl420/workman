package com.wework.workman.approval.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.wework.workman.approval.model.vo.Doc;
import com.wework.workman.common.Conflrm;
import com.wework.workman.common.PageInfo;

public interface ListService {

	int getallListCount(String userNum);
	
	ArrayList<Doc> docList(PageInfo pi, String userNum);
	
	int selectCount(HashMap select);
	
	ArrayList<Doc> docselectList(PageInfo pi, HashMap select);
	
	int approvalListCount(String userNum);
	
	ArrayList<Doc> approvalList(PageInfo pi, String userNum);
	
	int allRequestListCount(String userNum);
	
	ArrayList<Doc> docRequestList(PageInfo pi, String userNum);
	
	int selectRequestListCount(HashMap select);
	
	ArrayList<Doc> docsselectRequestList(PageInfo pi, HashMap select);
	

	
	
	
	
}
