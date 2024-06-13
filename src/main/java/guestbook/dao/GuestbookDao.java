package guestbook.dao;

import java.util.List;

import guestbook.VO.GuestVo;


public interface GuestbookDao {
    List<GuestVo> getList(); 
    boolean insert(GuestVo vo); 
    boolean delete(Long id);
    			GuestVo get(Long id);
				
}