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
	private String a_name;
	private String a_day;
	private String a_address;
	private String a_tel;
	private String a_time;
	private int a_category;// 대분류
	private int a_m_category;// 소분류
	/*
	 * hashtag의 종류
	 * 1. 활동적인
	 * 2. 조용한
	 * 3. 섬세한
	 * 4. 예술적인
	 * 5. 
	 * */
}
