package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Member;

@Mapper
public interface MemberDao {

	Member selectByMid(String username);

}
