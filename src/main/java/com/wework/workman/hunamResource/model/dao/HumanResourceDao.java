package com.wework.workman.hunamResource.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.hunamResource.model.vo.Dept;
import com.wework.workman.hunamResource.model.vo.Modal;

@Repository("humanResourceDao")
public class HumanResourceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int gethListCount() {
		
		return sqlSession.selectOne("humanMapper.gethListCount");
	}

	// ModalDeptList 불러오기
	public ArrayList<Dept> selectModaDeptlList() {
		return (ArrayList)sqlSession.selectList("humanMapper.selectModaDeptlList");
		}
	// ModalEmpList 불러오기
	public ArrayList<Modal> selectModalEmpList() {
		return (ArrayList)sqlSession.selectList("humanMapper.selectModalEmpList");
	}
}
