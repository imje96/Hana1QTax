package com.spring.oneqtax.tax.domain;

import lombok.Data;

@Data
public class BigDTO {

    private TaxFormVO taxFormVO;
    private FPensionVO pensionVO;
    private FHousingVO housingVO;
    private FGuaranteeVO guaranteeVO;
    private FMedicalVO medicalVO;
    private FEduVO eduVO;
    private FDonationVO donationVO;
    private FRentVO rentVO;
    private PreTaxVO preTaxVO;
}
