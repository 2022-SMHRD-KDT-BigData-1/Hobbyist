package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //어노테이션
//@Data의 역할은 getter/setter 메소드를 자동 생성

@NoArgsConstructor
//기본 생성자를 생성해줌.

@AllArgsConstructor
public class MarkerDTO {
	private String AC_ID; 
	private String AC_NAME;
	private String AC_CITY;
	private String AC_SI;
	private String AC_DONG;
	private String AC_ADDR;
	private String AC_CATEGORY;
	private String A_IMG;
	private String AC_REV;
	private String AC_REL;
	private String AC_WI;
	private String AC_KY;
}
