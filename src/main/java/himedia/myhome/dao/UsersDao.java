package himedia.myhome.dao;

import java.util.List;

import himedia.myhome.vo.UserVo;

public interface UsersDao {
	
	public List<UserVo> getList(); // 목록
	public boolean insert(UserVo uservo); // 인서트
	public boolean update(UserVo uservo); // 업데이트
	public boolean delete(Long no); // 삭제
	public UserVo getUserByIdAndPassword(String email,String password); 

}
