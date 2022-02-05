package com.message.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//Ŀ�´�Ƽ ��� ���̺�

@Data //������̼�
//@Data�� ������ getter/setter �޼ҵ带 �ڵ� ����

@NoArgsConstructor
//�⺻ �����ڸ� ��������.

@AllArgsConstructor
public class CommentDTO {
	private int com_seq;
	private int c_seq;
	private String m_nick;
	private String com_content;
	private String com_date;
	private String com_pw;
}
