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


public class AcademyDTO {
	private String a_id; 
	private String a_name;
	private String a_address;
	private String a_L_category;
	private String a_m_category;
	private String a_note;
	private String a_city;
}
