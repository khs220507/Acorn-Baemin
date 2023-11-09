package com.acorn.baemin.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDTO {
    private int reviewCode;
    private int menuCode;
    private int userCode;
    private int storeCode;
    private String reviewImage;
    private String reviewDate;
    private int reviewRating;
    private String reviewContent;
}