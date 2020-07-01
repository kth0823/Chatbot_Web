package com.example.demo.dao;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.example.demo.vo.UserVO;



@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject SqlSession sql;
	// 회원가입

	@Override
	public void register(UserVO vo) throws Exception {
		sql.insert("userMapper.register", vo);
	}
}
