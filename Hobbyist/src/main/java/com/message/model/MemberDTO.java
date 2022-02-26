package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //어노테이션
//@Data의 역할은 getter/setter 메소드를 자동 생성

@NoArgsConstructor
//기본 생성자를 생성해줌.

@AllArgsConstructor
//모든 필드변수를 초기화하는 생성자를 생성해줌.
//변수, 생성자, getter/setter, toString() 정의

public class MemberDTO {
//	public MemberDTO(String m_email2, Object object, String m_tel2, String m_address2) {
//		// TODO Auto-generated constructor stub
//	}
	
	private String m_email;
	private String m_pw;
	private String m_name;
	private String m_nick;
	private String m_tel;
	private String m_address;
	private int m_age;
	private String m_gender;
	private String a_id;
}
