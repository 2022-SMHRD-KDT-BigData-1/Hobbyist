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
	private String m_email;
	private String m_address;//�� �ּ�
	private String res_area;//��ġ
	private String a_L_category; //��з�
	private String a_S_category; // �Һз�
	private String a_day;//� ����
	private String a_time;//� �ð�

}
