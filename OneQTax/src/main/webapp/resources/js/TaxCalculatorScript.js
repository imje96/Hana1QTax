function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}/*근로소득공제 금액 산출*/

function TaxCalculate(){
    let 총급여 = Number(document.getElementById('총급여입력').value.replaceAll(',',''))
    let 근로소득공제 = document.querySelector('#근로소득공제');
    let 근로소득금액 = document.querySelector('#근로소득금액');
    let 소득공제 = document.querySelector('#소득공제');
    let 과세표준 = document.querySelector('#과세표준');
    let 산출세액 = document.querySelector('#산출세액');
    let 세액감면 = document.querySelector('#세액감면');
    let 세액공제 = document.querySelector('#세액공제');
    let 결정세액 = document.querySelector('#결정세액');
    let 기납부세액 = document.querySelector('#기납부세액');
    let 차감납부세액 = document.querySelector('#차감납부세액');

    if(총급여 < 5000001){
        근로소득공제 = 총급여*0.7
    } if(총급여 > 5000000){
        근로소득공제 = (총급여-5000000)*0.4 + 3500000
    } if(총급여 > 15000000){
        근로소득공제 = (총급여-15000000)*0.15 + 7500000
    } if(총급여 > 45000000){
        근로소득공제 = (총급여-45000000)*0.05 + 12000000
    } if(총급여 > 100000000){
        근로소득공제 = (총급여-100000000)*0.02 + 14750000
    }

    근로소득공제 = Math.floor(근로소득공제)

    /*근로소득금액 산출*/
    근로소득금액 = 총급여-근로소득공제


    /*소득공제 기능 우선은 본인 150만원으로 가정*/
    인적공제기본 = 1500000
    인적공제추가 = 500000
    인적공제 = 인적공제기본+인적공제추가
    인적공제 = Math.floor(인적공제)



    /*연금보험료 공제*/
    건강보험공제 = 0
    건강보험공제 = 총급여*0.0345
    고용보험공제 = 0
    고용보험공제 = 총급여*0.009
    국민연금공제 = 0
    국민연금공제 = 총급여*0.045
    연금보험료공제 = Math.floor(건강보험공제+고용보험공제+국민연금공제)

    /* 주택마련 공제 */
    주택관련공제 = 0

    /* 신용카드 등 공제 */
    신용카드공제 = 0
    추가소득공제 = 0

    소득공제 = 0
    소득공제 = 인적공제+연금보험료공제+주택관련공제+신용카드공제+추가소득공제

    /*과세표준*/
    과세표준 = Math.max(근로소득금액-소득공제,0)

    /*산출세액 계산*/
    if(과세표준 < 14000001){
        산출세액 = 과세표준*0.06
    } if(과세표준 > 14000000){
        산출세액 = 840000 + (과세표준-14000000)*0.15
    } if(과세표준 > 50000000){
        산출세액 = 6240000 + (과세표준-50000000)*0.24
    } if(과세표준 > 88000000){
        산출세액 = 15360000 + (과세표준-88000000)*0.35
    } if(과세표준 > 150000000){
        산출세액 = 37060000 + (과세표준-150000000)*0.38
    } if(과세표준 > 300000000){
        산출세액 = 94060000 + (과세표준-300000000)*0.40
    } if(과세표준 > 500000000){
        산출세액 = 174600000 + (과세표준-500000000)*0.42
    } if(과세표준 > 1000000000){
        산출세액 = 384060000 + (과세표준-1000000000)*0.45
    }

    산출세액 = Math.floor(산출세액)

    /*세액감면*/
    세액감면 = 0
    세액감면 = Math.floor(세액감면)

    /*세액공제*/
    연금계좌공제 = 0
    보장성보험공제 = 0
    의료비공제 = 0
    교육비공제 = 0
    기부금공제 = 0
    월세공제 = 0
    세액공제 = 연금계좌공제+보장성보험공제+의료비공제+교육비공제+기부금공제+월세공제
    세액공제 = Math.floor(세액공제)


    /*결정세액*/
    결정세액 = 산출세액 - 세액감면 - 세액공제

    /*차감납부할세액*/
//  차감납부세액 = 결정세액 - 기납부세액

//  document.getElementById("총급여").value =  총급여.toLocaleString();
    document.getElementById("근로소득공제").innerText =  근로소득공제.toLocaleString();
    document.getElementById("근로소득금액").innerText =  근로소득금액.toLocaleString();
    document.getElementById("소득공제").innerText =  소득공제.toLocaleString();
    document.getElementById("과세표준").innerText =  과세표준.toLocaleString();
    document.getElementById("산출세액").innerText =  산출세액.toLocaleString();
    document.getElementById("세액감면").innerText =  세액감면.toLocaleString();
    document.getElementById("세액공제").innerText =  세액공제.toLocaleString();
    document.getElementById("결정세액").innerText =  결정세액.toLocaleString();
    //document.getElementById("기납부세액").innerText =  기납부세액.toLocaleString();
    //document.getElementById("차감납부할세액").innerText =  차감납부할세액.toLocaleString();
}