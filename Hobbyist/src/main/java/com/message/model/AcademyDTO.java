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
	public AcademyDTO(String a_id2, String a_classname2, String a_tel2, String a_address2) {
	
	}
	private int a_seq;
	private String a_id; // 학원코드
	private String a_classname;// 학원명
	private String a_address;
	private String a_tel;
	private String a_day;
	private String a_time;
	private String a_position;
	private int a_category;// 대분류
	private int a_m_category;// 소분류
	private int a_up;// 추천수
}
