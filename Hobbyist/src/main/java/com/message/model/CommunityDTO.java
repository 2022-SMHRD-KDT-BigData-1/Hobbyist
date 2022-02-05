package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //어노테이션
//@Data의 역할은 getter/setter 메소드를 자동 생성

@NoArgsConstructor
//기본 생성자를 생성해줌.

@AllArgsConstructor
public class CommunityDTO {
	private int c_seq; //시퀀스
	private String c_title; //제목
	private String c_writer; //작성자(이메일)
	private String c_pw; //
	private String c_view;
	private String c_date;
	private String c_content;
}
