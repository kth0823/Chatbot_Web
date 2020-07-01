package com.example.demo;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController 
public class UserInfoControler {

	@Autowired
	private UserInfoMapper mapper;
 
 
	// post test
	@ResponseBody
	@PostMapping("/UserInfoList")
	public HashMap<String, Object> UserInfoList(@RequestBody HashMap<String, Object>map) { 
		
		List<UserInfoDto> list = mapper.UserInfoList();
		map.put("ret", "succ"); 
		
		for(UserInfoDto userInfo : list)
		{
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("Id", userInfo.getUser_id()); 
			hashMap.put("Phone", userInfo.getUser_phone()); 
			hashMap.put("Passwd", userInfo.getUser_passwd()); 
			
			map.put(userInfo.getUser_id(), hashMap);
		} 
		
		return map;
	} 


	@ResponseBody
	@PostMapping("/UserInfo")
	public HashMap<String, Object> UserInfo(@RequestBody HashMap<String, Object>map) { 
		 
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		Object obj = map.get("id");
		String id = null;
		if( obj == null ) System.out.println("id is null!!!");
		else {
			id = obj.toString();
		}

		if( id != null ) {
			UserInfoDto userInfo = mapper.UserInfo(id);
			 
			
			if( userInfo != null ) {
				retMap.put("Id", userInfo.getUser_id()); 
				retMap.put("Phone", userInfo.getUser_phone()); 
				retMap.put("Passwd", userInfo.getUser_passwd()); 
				
				retMap.put("ret", "succ");
			}
			else {
				retMap.put("ret", "fail");
			}			
		} else {
			retMap.put("ret", "fail");
		}
		
		return retMap;
	}

	// post test
	@ResponseBody
	@PostMapping("/Add")
	public HashMap<String, Object> Add(@RequestBody HashMap<String, Object>map) { 
		
		HashMap<String, Object> retMap = new HashMap<String, Object>();
		Object obj = map.get("id");
		String id = null;
		if( obj == null ) System.out.println("id is null!!!");
		else {
			id = obj.toString();
		}

		if( id != null ) {
			UserInfoDto userInfo = mapper.UserInfo(id);
			 
			
			if( userInfo != null ) {
				retMap.put("Id", userInfo.getUser_id()); 
				retMap.put("Phone", userInfo.getUser_phone()); 
				retMap.put("Passwd", userInfo.getUser_passwd()); 
				
				retMap.put("ret", "succ");
			}
			else {
				retMap.put("ret", "fail");
			}			
		} else {
			retMap.put("ret", "fail");
		}
		
		return retMap;
	} 


}
