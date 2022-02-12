package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //������̼�
//@Data�� ������ getter/setter �޼ҵ带 �ڵ� ����

@NoArgsConstructor
//�⺻ �����ڸ� ��������.

@AllArgsConstructor
//��� �ʵ庯���� �ʱ�ȭ�ϴ� �����ڸ� ��������.
//����, ������, getter/setter, toString() ����

public class HistoryDTO {
	private int h_seq;
	private String a_name;
	private String h_day;
	private String h_time;
	private String a_city;
	private String h_tel;
}
