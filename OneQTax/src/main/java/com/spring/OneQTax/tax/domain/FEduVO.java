package com.spring.oneqtax.tax.domain;

import lombok.Data;

@Data
public class FEduVO {
    //    private int education_total;
    private int edu_expense;  // 본인교육비
    private int children_edu; // 20세 미만 자녀교육비
    private int univ_edu;     // 대학생 자녀교육비
    private int uniform_expense; // 교복구입비
}
