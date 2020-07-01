package com.example.demo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
 
@Mapper
public interface UserInfoMapper{
	public List<UserInfoDto> UserInfoList();
	
	public UserInfoDto UserInfo(String id);
} 
 
