package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//커뮤니티 댓글 테이블

@Data //어노테이션
//@Data의 역할은 getter/setter 메소드를 자동 생성

@NoArgsConstructor
//기본 생성자를 생성해줌.

@AllArgsConstructor
public class CommentDTO {
	private int com_seq;
	private int c_seq;
	private String m_nick;
	private String com_content;
	private String com_date;
	private String com_pw;
}
