package com.example.demo.service;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.example.demo.dao.UserDAO;
import com.example.demo.vo.UserVO;

@Service
public class UserServiceImpl implements  UserService{
    
	@Inject UserDAO dao;
	
	@Override
	public void register(UserVO vo) throws Exception {
		
		dao.register(vo);
		
	}
	
	
}
