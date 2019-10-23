package com.wework.workman.chatting.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.chatting.model.vo.Room;

@Repository("chattingDao")
public class ChattingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Room>getRoomList(String userId){
		return (ArrayList)sqlSession.selectList("chattingMapper.RoomList",userId);
	}
	
}
