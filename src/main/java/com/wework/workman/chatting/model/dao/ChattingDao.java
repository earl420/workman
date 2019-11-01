package com.wework.workman.chatting.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.chatting.model.vo.Message;
import com.wework.workman.chatting.model.vo.Room;

@Repository("cDao")
public class ChattingDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	//userId에대한 채팅방 리스트, 채팅방들의 마지막전송일시,전송자, 메세지내용
	public ArrayList<Room>getRoomList(String userId){
		List<String> list = (List)sqlSession.selectList("chattingMapper.userRoomList",userId);
		
		ArrayList<Room> setList = new ArrayList<>();
		for(int i=0;i<list.size();i++) {
			String rList = (String) list.get(i);
			setList.add(sqlSession.selectOne("chattingMapper.initialLastChat",rList));
		}
		return setList; 
	}
	
	public ArrayList<Message>msgHistory(String roomId){
		ArrayList<Message> list = (ArrayList)sqlSession.selectList("chattingMapper.msgHistory",roomId);
		return list;
	}
	public int msgDb(Message msg) {
		int result = sqlSession.insert("chattingMapper.msgDb",msg);
		return result;
	}
	
}