package com.wework.workman.chatting.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
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
	private String sysId;
	
	public String sysId() {
		 sysId=sqlSession.selectOne("chattingMapper.sysId");
		return sysId;
	}
	//userId에대한 채팅방 리스트, 채팅방들의 마지막전송일시,전송자, 메세지내용
	public ArrayList<Room>getRoomList(String userId){
		List<String> list = (List)sqlSession.selectList("chattingMapper.getRoomList",userId);
		
		ArrayList<Room> setList = new ArrayList<>();
		for(int i=0;i<list.size();i++) {
			String rList = (String) list.get(i);
			setList.add(sqlSession.selectOne("chattingMapper.initialLastChat",rList));
		}
		return setList; 
	}
	public Room getRoom(String roomId) {
		return sqlSession.selectOne("chattingMapper.getRoom",roomId);
	}
	
	public ArrayList<Message>msgHistory(String roomId){
		ArrayList<Message> list = (ArrayList)sqlSession.selectList("chattingMapper.msgHistory",roomId);
		return list;
	}
	public int msgDb(Message msg) {
		int result = sqlSession.insert("chattingMapper.msgDb",msg);
		return result;
	}
	
	public String newChat(String userId) {
		System.out.println("dao newChat userId : "+userId);
		
		//룸생성 userId로 이름
		sqlSession.insert("chattingMapper.insertNewChat",userId);
		
		//생성룸아이디 받기
		String roomId = sqlSession.selectOne("chattingMapper.selectNewChat");
		
		//chat_join에 생성한 유저넣기
		addUser(roomId,userId);
		//chat_join에system 넣어놓기
		addUser(roomId,sysId);
		return roomId;
	}
	public int addUser(String roomId, String userId) {
		System.out.println("dao adUser userId : "+userId);
		System.out.println("dao addUser roomId : "+roomId);
		HashMap<String, String> m1 = new HashMap<>();
		m1.put("roomId",roomId);
		m1.put("userId", userId);
		int result = sqlSession.insert("chattingMapper.insertUser",m1);
		return result;
	}
	public String getName(String userId) {
		System.out.println(userId);
		String userName=sqlSession.selectOne("chattingMapper.getName",userId);
		System.out.println(userName);
		return userName;
	}
}