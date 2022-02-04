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
	private int r_num;
	private String r_nick;
	private String r_name;//�п� �̸�
	private String r_pw;//�Ϲ� ��й�ȣ�� �ٸ� ��й�ȣ
	private String r_content;
	private int r_score;
	private String r_date;
}
