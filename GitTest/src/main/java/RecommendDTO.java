package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //어노테이션
//@Data의 역할은 getter/setter 메소드를 자동 생성

@NoArgsConstructor
//기본 생성자를 생성해줌.

@AllArgsConstructor
public class RecommendDTO {
	private int re_num;
	private String re_email;
	private String re_name;//학원명
	private String re_day;//수강 요일
	private String re_address;//학원 위치
	private String re_time;//
	private String a_category;
	private String a_m_category;
}
