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
	private int rev_num;
	private String rev_nick;
	private String rev_name;//�п� �̸�
	private String rev_pw;//�Ϲ� ��й�ȣ�� �ٸ� ��й�ȣ
	private String rev_content;
	private int rev_score;
	private String rev_date;
}
