package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //어노테이션
//@Data의 역할은 getter/setter 메소드를 자동 생성

@NoArgsConstructor
//기본 생성자를 생성해줌.

@AllArgsConstructor
public class ReviewDTO {
	private int re_seq;
	private String m_nick;
	private String a_classname;//학원 이름
	private String re_pw;//일반 비밀번호와 다른 비밀번호
	private String re_content;
	private int re_score;
	private String re_date;


}
