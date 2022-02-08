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
	private int com_seq; //댓글 번호
	private int c_seq; //게시글 번호
	private String m_nick; 
	private String com_content; //댓글 내용
	private String com_date;
	private String com_pw; //댓글 수정 삭제 PW
}
