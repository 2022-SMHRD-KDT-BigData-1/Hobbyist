package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //������̼�
//@Data�� ������ getter/setter �޼ҵ带 �ڵ� ����

@NoArgsConstructor
//�⺻ �����ڸ� ��������.

@AllArgsConstructor
public class ReviewDTO {
	private int re_seq;
	private String m_nick;
	private String a_classname;//�п� �̸�
	private String re_pw;//�Ϲ� ��й�ȣ�� �ٸ� ��й�ȣ
	private String re_content;
	private int re_score;
	private String re_date;


}
