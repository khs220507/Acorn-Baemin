package com.acorn.baemin.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDTO {
    private int reviewCode;
    private String orderMenuName;
    private int userCode;
    private int storeCode;
    private MultipartFile reviewImage;
    private String reviewDate;
    private int reviewRating;
    private String reviewContent;
    private String reviewImageName;
    
    // add
    private String userNickName;
    
    
}