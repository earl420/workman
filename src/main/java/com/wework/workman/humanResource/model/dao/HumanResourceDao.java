package com.wework.workman.humanResource.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wework.workman.common.Attachment;
import com.wework.workman.common.PageInfo;
import com.wework.workman.humanResource.model.vo.Att;
import com.wework.workman.humanResource.model.vo.Department;
import com.wework.workman.humanResource.model.vo.Dept;
import com.wework.workman.humanResource.model.vo.Employee;
import com.wework.workman.humanResource.model.vo.Grade;
import com.wework.workman.humanResource.model.vo.HoliCount;
import com.wework.workman.humanResource.model.vo.Modal;
import com.wework.workman.humanResource.model.vo.MyHoli;
import com.wework.workman.humanResource.model.vo.Notice;

@Repository("humanResourceDao")
public class HumanResourceDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getnListCount() {

		return sqlSession.selectOne("humanMapper.getnListCount");
	}

	public ArrayList<Notice> selectnList(PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("humanMapper.selectnList", null, rowBounds);

	}

	public Notice getnDetail(String noticeNum) {

		return sqlSession.selectOne("humanMapper.selectNotice", noticeNum);
	}

	public int updateNotice(Notice n) {

		return sqlSession.update("humanMapper.updateNotice", n);
	}

	public int gethListCount() {

		return sqlSession.selectOne("humanMapper.gethListCount");
	}

	public ArrayList<Notice> selectHRnList(PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("humanMapper.selectHRnList", null, rowBounds);

	}

	public Notice gethrnDetail(String noticeNum) {

		return sqlSession.selectOne("humanMapper.selectNotice", noticeNum);
	}

	public int insertNotice(Notice n) {

		return sqlSession.insert("humanMapper.insertNotice", n);
	}

	public int insertAtt(Attachment a) {

		return sqlSession.insert("humanMapper.insertAtt", a);
	}

	public ArrayList<Department> selectDeptList() {

		return (ArrayList) sqlSession.selectList("humanMapper.selectDeptList");
	}

	public ArrayList<Employee> selectEmp() {

		return (ArrayList) sqlSession.selectList("humanMapper.selectEmp");
	}

	public ArrayList<Employee> getEmpCount() {

		return (ArrayList) sqlSession.selectList("humanMapper.selectEmpCount");
	}

	// ModalDeptList 불러오기
	public ArrayList<Dept> selectModaDeptlList() {
		return (ArrayList) sqlSession.selectList("humanMapper.selectModaDeptlList");
	}

	// ModalGradeList 불러오기
	public ArrayList<Grade> selectModalGradeList() {
		return (ArrayList) sqlSession.selectList("humanMapper.selectModalGradeList");
	}

	// ModalEmpList 불러오기
	public ArrayList<Modal> selectModalEmpList() {
		return (ArrayList) sqlSession.selectList("humanMapper.selectModalEmpList");
	}

	public ArrayList<Modal> selectModalList(String[] empList) {
		ArrayList<Modal> list = new ArrayList();
		for (int i = 0; i < empList.length; i++) {
			list.add((Modal) sqlSession.selectOne("humanMapper.selectModalList", empList[i]));
		}
		return list;
	}

	public int addDept(String deptName) {

		return sqlSession.insert("humanMapper.addDept", deptName);
	}

	public int updateDept(Dept d) {

		return sqlSession.update("humanMapper.updateDept", d);
	}

	public int deleteDept(int deptNum) {

		return sqlSession.delete("humanMapper.deleteDept", deptNum);
	}

	public int insertEmp(Employee e) {

		return sqlSession.insert("humanMapper.insertEmp", e);
	}

	public int setHoliday() {

		return sqlSession.insert("humanMapper.setHoliday");
	}

	public int getDeptNum(String deptName) {

		return sqlSession.selectOne("humanMapper.getDeptNum", deptName);
	}

	public int getGradeNum(String gradeName) {

		return sqlSession.selectOne("humanMapper.getGradeNum", gradeName);
	}

	public ArrayList<Employee> elistByName(String deptName) {

		return (ArrayList) sqlSession.selectList("humanMapper.elistByName", deptName);
	}

	public int updateEmp(Employee e) {

		return (int) sqlSession.update("humanMapper.updateEmp", e);
	}

	public int getThisLate(String empNum) {
		
		return sqlSession.selectOne("humanMapper.getThisLate", empNum);
	}

	public int getnoOn(String empNum) {

		return sqlSession.selectOne("humanMapper.getnoOn", empNum);
	}

	public int getnoOff(String empNum) {

		return sqlSession.selectOne("humanMapper.getnoOff", empNum);
	}
	
	public ArrayList<Att> getMonthAtt(String empNum){
		
		
		return (ArrayList)sqlSession.selectList("humanMapper.getMonthAtt", empNum);
	}
	
	public ArrayList<MyHoli> showMyHoliday(String empNum){
		
		return (ArrayList)sqlSession.selectList("humanMapper.showMyHoliday", empNum);
	}
	
	public HoliCount myHoliCount(String empNum) {
		
		return sqlSession.selectOne("humanMapper.myHoliCount", empNum);
	}
}
