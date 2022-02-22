package com.message.model;

import java.sql.Time;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //어노테이션
//@Data의 역할은 getter/setter 메소드를 자동 생성

@NoArgsConstructor
//기본 생성자를 생성해줌.

@AllArgsConstructor
//모든 변수를 포함한 생성자를 생성해줌

public class CommunityDTO2 {
	private int no;
	private String m_nick;
	private String c_pw;
	private String c_title;
	private String c_content;
	private Timestamp c_date;
	private int c_readCount;
	private String ip;
}







