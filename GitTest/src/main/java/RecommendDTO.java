package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //������̼�
//@Data�� ������ getter/setter �޼ҵ带 �ڵ� ����

@NoArgsConstructor
//�⺻ �����ڸ� ��������.

@AllArgsConstructor
public class RecommendDTO {
	private int re_num;
	private String re_email;
	private String re_name;//�п���
	private String re_day;//���� ����
	private String re_address;//�п� ��ġ
	private String re_time;//
	private String a_category;
	private String a_m_category;
}
