package com.acorn.baemin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AnswerDTO {
	Integer answerCode;
	Integer storeCode;
	Integer reviewCode;
	String answerDate;
	String answerContent; 
}
