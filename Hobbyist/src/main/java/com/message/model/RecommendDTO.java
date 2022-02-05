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
	private String m_email;
	private String m_address;//집 주소
	private String res_area;//위치
	private String a_L_category; //대분류
	private String a_S_category; // 소분류
	private String a_day;//운영 요일
	private String a_time;//운영 시간

}
