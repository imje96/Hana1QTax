<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--숫자를 원화로 포맷팅--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--localTimestamp 초 까지만 출력--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!--header-->


<!DOCTYPE html>
<html>
<head>
    <title>HanaOneQTax</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="../../../resources/css/dashboard.css">
    <link rel="stylesheet" href="../../../resources/css/common.css">
    <!--script-->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="../../../resources/js/scrolla.jquery.min.js"></script>
    <script src="../../../resources/js/dashboard.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<body>
<%--<div class="wrap">--%>

    <header>
        <%@ include file="common/header.jsp" %>
    </header>
<%-- 카드 리스트 --%>
<style>
    body {
        background: #f5f5f5;
        margin: 0 auto;
    }

    .slideshow {
        position: absolute;
        height: 100%;
        width: 100%;
        box-sizing: border-box;
        border: 3px solid #f5f5f5;
        overflow: hidden;
    }

    .slideshowContents {
        display: flex; /* Use flexbox for side-by-side display */
        height: 100%;
        transition: transform 300ms;
    }

    .slide {
        flex: 0 0 100%; /* Each slide occupies full width */
        height: 100%;
        padding: 10px;
    }

    .nextSlide,
    .lastSlide {
        position: absolute;
        height: 100%;
        width: 100px;
        top: 50%;
        transform: translateY(-50%); /* Center vertically */
        background: none;
        font-size: 3em;
        font-weight: 900;
        color: #fff;
        text-shadow: 0px 0px 4px #000;
        cursor: pointer;
        border: none;
        transition: background 200ms;
        z-index: 9999;
    }
    .nextSlide:hover,
    .lastSlide:hover {
        background: rgba(0, 0, 0, 0.1);
    }
    .nextSlide {
        right: 0; /* Aligned to the right */
    }

    .lastSlide {
        left: 0; /* Aligned to the left */
    }

    /* Random Pallette: ["#CC90C6","#8DCFF9","#4EF0BA","#0CAE78"] */
    .s1 {
        background: #cc90c6;
    }
    .s2 {
        background: #8dcff9;
    }
    .s3 {
        background: #4ef0ba;
    }
    .s4 {
        background: #0cae78;
    }
    /* Repeating color scheme */
    /* .slide:nth-child(1n) {
        background: #cc90c6;
    }
    .slide:nth-child(2n) {
        background: #8dcff9;
    }
    .slide:nth-child(3n) {
        background: #4ef0ba;
    }
    .slide:nth-child(4n) {
        background: #0cae78;
    } */

</style>


    <div class="container">

        <main class="main-content">
            <div class="top-container">

                <div class="text">
                    <h1 class="title">소비현황 모아보기</h1>
                    <!-- <div action="#" class="search">
                        <svg class="search__icon" width="22" height="22" viewBox="0 0 22 22" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M10.5418 19.25C15.3513 19.25 19.2502 15.3512 19.2502 10.5417C19.2502 5.73223 15.3513 1.83337 10.5418 1.83337C5.73235 1.83337 1.8335 5.73223 1.8335 10.5417C1.8335 15.3512 5.73235 19.25 10.5418 19.25Z"
                                stroke="#596780" stroke-width="1.5" stroke-linecap="round"
                                stroke-linejoin="round" />
                            <path d="M20.1668 20.1667L18.3335 18.3334" stroke="#596780" stroke-width="1.5"
                                stroke-linecap="round" stroke-linejoin="round" />
                        </svg>
                        <input type="text" class="search__input" placeholder="Search something here">
                    </div> -->
                    <div class="aside" style="width: 20%; float: left;">
                        <br/>
                        <br/>
                        <br/>
                        <div style="padding-left: 30px;">
                            <h3 style="color: #065859; margin-bottom: 15px;">카드황금비율관리</h3>
                            <hr style="width: 200px; height: 4px; background-color: #018c8d; margin-bottom: 15px;">
                            <a href="${pageContext.request.contextPath}/taxMain"
                               style="display: block; margin-bottom: 20px;">
                                <div style="color: grey; margin-bottom: 15px;">소득공제 안내</div>
                            </a>
                            <hr style="width: 200px; margin-bottom: 15px;">
                            <a href="${pageContext.request.contextPath}/taxThreshold"
                               style="display: block; margin-bottom: 20px;">
                                <div style="color: grey; margin-bottom: 15px;">소비 문턱 넘기기</div>
                            </a>
                            <hr style="width: 200px; margin-bottom: 15px;">
                            <a href="${pageContext.request.contextPath}/taxInfo" style="display: block; margin-bottom: 20px;">
                                <div style="color: grey; margin-bottom: 15px;">카드황금비율 계산</div>
                            </a>
                            <hr style="width: 200px; margin-bottom: 15px;">

                            <a href="${pageContext.request.contextPath}/getLatestDeductionResult"
                               style="display: block; margin-bottom: 20px;">
                                <h6 style="color: black; margin-bottom: 15px;">카드황금비율 결과</h6></a>
                            <hr style="width: 200px; margin-bottom: 15px;">
                            <a href="${pageContext.request.contextPath}/spouseResult"
                               style="display: block; margin-bottom: 20px;">
                                <div style="color: grey; margin-bottom: 15px;">우리집 돈관리</div>
                            </a>
                            <hr style="width: 200px;">
                        </div>
                    </div>
                        <div class="bottom-container">
                            <div class="bottom-container__left">
                                <div class="box spending-box">
                                    <div class="header-container">
                                        <h3 class="section-header">내 카드</h3>
                                        <div class="year-selector">
<%--                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"--%>
<%--                                                 xmlns="http://www.w3.org/2000/svg">--%>
<%--                                                <rect opacity="0.8" width="24" height="24" rx="6" fill="#F6F7F9"/>--%>
<%--                                                <path--%>
<%--                                                        d="M13.4999 15.96L10.2399 12.7C9.85492 12.315 9.85492 11.685 10.2399 11.3L13.4999 8.04004"--%>
<%--                                                        stroke="#1A202C" stroke-width="1.5" stroke-miterlimit="10"--%>
<%--                                                        stroke-linecap="round" stroke-linejoin="round"/>--%>
<%--                                            </svg>--%>
<%--                                            <span>2023</span>--%>
<%--                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"--%>
<%--                                                 xmlns="http://www.w3.org/2000/svg">--%>
<%--                                                <rect opacity="0.8" width="24" height="24" rx="6" fill="#F6F7F9"/>--%>
<%--                                                <path--%>
<%--                                                        d="M10.4551 15.96L13.7151 12.7C14.1001 12.315 14.1001 11.685 13.7151 11.3L10.4551 8.04004"--%>
<%--                                                        stroke="#1A202C" stroke-width="1.5" stroke-miterlimit="10"--%>
<%--                                                        stroke-linecap="round" stroke-linejoin="round"/>--%>
<%--                                            </svg>--%>
                                        </div>
                                    </div>
                                    <div class="bar-chart">
<%--                                        <canvas id="myChart" height="220px" width="660px"></canvas>--%>
<%--                                        <canvas id="deductionChart2" height="220px" width="660px"></canvas>--%>
    <div class="slideshow">
        <button class="lastSlide" title="Last slide">&lt;</button>
        <button class="nextSlide" title="Next slide">&gt;</button>

        <div class="slideshowContents">
            <div class="slide s1">
                Slide 1
            <img src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/13015.png">
            </div>
            <div class="slide s2">
                Slide 2
                <img src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/11530.png">
            </div>
            <div class="slide s3">
                Slide 3
                <img src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/11534.png">
            </div>
            <div class="slide s4">
                Slide 4
            </div>
            <!-- add more divs with the "slide" class here -->
        </div>
    </div>
                                    </div>
                                </div>
                                <div class="box total-box">
                                    <div class="total-box__left">
                                        <div class="header-container">
                                            <h3 class="section-header">Total Income</h3>
                                            <svg class="up-arrow" width="42" height="42" viewBox="0 0 42 42" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <rect width="42" height="42" rx="8" fill="#F6F7F9"/>
                                                <path d="M27.0702 18.57L21.0002 12.5L14.9302 18.57" stroke="#7FB519"
                                                      stroke-width="2" stroke-miterlimit="10" stroke-linecap="round"
                                                      stroke-linejoin="round"/>
                                                <path d="M21 29.5V12.67" stroke="#7FB519" stroke-width="2"
                                                      stroke-miterlimit="10" stroke-linecap="round"
                                                      stroke-linejoin="round"/>
                                            </svg>
                                        </div>
                                        <h1 class="price">$50,530.00<span class="price-currency">(원)</span></h1>
                                        <p><span class="percentage-increase">20%</span> increase compared to last week
                                        </p>
                                    </div>
                                    <div class="total-box__right">
                                        <div class="header-container">
                                            <h3 class="section-header">Total Expense</h3>
                                            <svg width="42" height="42" viewBox="0 0 42 42" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <rect width="42" height="42" rx="8" fill="#F6F7F9"/>
                                                <path d="M27.0702 23.43L21.0002 29.5L14.9302 23.43" stroke="#FF4423"
                                                      stroke-width="2" stroke-miterlimit="10" stroke-linecap="round"
                                                      stroke-linejoin="round"/>
                                                <path d="M21 12.5V29.33" stroke="#FF4423" stroke-width="2"
                                                      stroke-miterlimit="10" stroke-linecap="round"
                                                      stroke-linejoin="round"/>
                                            </svg>
                                        </div>
                                        <h1 class="price">$50,530.00<span class="price-currency">(원)</span></h1>
                                        <p><span class="percentage-decrease">10%</span> decrease compared to last week
                                        </p>
                                    </div>
                                </div>
                                <div class="box transaction-box">
                                    <div class="header-container">
                                        <h3 class="section-header">Transaction History</h3>
                                        <div class="date-selector">
                                            <svg width="18" height="18" viewBox="0 0 18 18" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <path d="M6 1.5V3.75" stroke="#292D32" stroke-width="1.5"
                                                      stroke-miterlimit="10" stroke-linecap="round"
                                                      stroke-linejoin="round"/>
                                                <path d="M12 1.5V3.75" stroke="#292D32" stroke-width="1.5"
                                                      stroke-miterlimit="10" stroke-linecap="round"
                                                      stroke-linejoin="round"/>
                                                <path d="M2.625 6.8175H15.375" stroke="#292D32" stroke-width="1.5"
                                                      stroke-miterlimit="10" stroke-linecap="round"
                                                      stroke-linejoin="round"/>
                                                <path
                                                        d="M15.75 6.375V12.75C15.75 15 14.625 16.5 12 16.5H6C3.375 16.5 2.25 15 2.25 12.75V6.375C2.25 4.125 3.375 2.625 6 2.625H12C14.625 2.625 15.75 4.125 15.75 6.375Z"
                                                        stroke="#292D32" stroke-width="1.5" stroke-miterlimit="10"
                                                        stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M11.7713 10.275H11.778" stroke="#292D32" stroke-width="2"
                                                      stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M11.7713 12.525H11.778" stroke="#292D32" stroke-width="2"
                                                      stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M8.99686 10.275H9.00359" stroke="#292D32" stroke-width="2"
                                                      stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M8.99686 12.525H9.00359" stroke="#292D32" stroke-width="2"
                                                      stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M6.22049 10.275H6.22723" stroke="#292D32" stroke-width="2"
                                                      stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M6.22049 12.525H6.22723" stroke="#292D32" stroke-width="2"
                                                      stroke-linecap="round" stroke-linejoin="round"/>
                                            </svg>
                                            <span>1 Jan - 1 Feb 2022</span>
                                        </div>
                                    </div>
                                    <table class="transaction-history">
                                        <tr>
                                            <th>Transactions</th>
                                            <th>Date
                                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                            d="M9.96004 4.47498L6.70004 7.73498C6.31504 8.11998 5.68504 8.11998 5.30004 7.73498L2.04004 4.47498"
                                                            stroke="#90A3BF" stroke-width="1.5" stroke-miterlimit="10"
                                                            stroke-linecap="round" stroke-linejoin="round"/>
                                                </svg>
                                            </th>
                                            <th>Amount
                                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                            d="M9.96004 4.47498L6.70004 7.73498C6.31504 8.11998 5.68504 8.11998 5.30004 7.73498L2.04004 4.47498"
                                                            stroke="#90A3BF" stroke-width="1.5" stroke-miterlimit="10"
                                                            stroke-linecap="round" stroke-linejoin="round"/>
                                                </svg>
                                            </th>
                                            <th>Status
                                                <svg width="12" height="12" viewBox="0 0 12 12" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                            d="M9.96004 4.47498L6.70004 7.73498C6.31504 8.11998 5.68504 8.11998 5.30004 7.73498L2.04004 4.47498"
                                                            stroke="#90A3BF" stroke-width="1.5" stroke-miterlimit="10"
                                                            stroke-linecap="round" stroke-linejoin="round"/>
                                                </svg>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <svg width="36" height="36" viewBox="0 0 36 36" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <circle cx="18" cy="18" r="18" fill="#33B938" fill-opacity="0.1"/>
                                                    <path
                                                            d="M24.875 21.8125V23.875H11.125V21.8125C11.125 21.4344 11.4344 21.125 11.8125 21.125H24.1875C24.5656 21.125 24.875 21.4344 24.875 21.8125Z"
                                                            fill="#33B938" stroke="#33B938" stroke-width="1.5"
                                                            stroke-miterlimit="10" stroke-linecap="round"
                                                            stroke-linejoin="round"/>
                                                    <path d="M13.6875 20.625V16.8125H14.0625V20.625H13.6875Z"
                                                          fill="#33B938"
                                                          stroke="#33B938"/>
                                                    <path d="M16.4375 20.625V16.8125H16.8125V20.625H16.4375Z"
                                                          fill="#33B938"
                                                          stroke="#33B938"/>
                                                    <path d="M19.1875 20.625V16.8125H19.5625V20.625H19.1875Z"
                                                          fill="#33B938"
                                                          stroke="#33B938"/>
                                                    <path d="M21.9375 20.625V16.8125H22.3125V20.625H21.9375Z"
                                                          fill="#33B938"
                                                          stroke="#33B938"/>
                                                    <path
                                                            d="M25.5625 23.8906H10.4375C10.4367 23.8906 10.436 23.8905 10.4346 23.89C10.4328 23.8892 10.4302 23.8876 10.4275 23.885C10.4249 23.8823 10.4233 23.8797 10.4225 23.8779C10.422 23.8765 10.4219 23.8758 10.4219 23.875C10.4219 23.8742 10.422 23.8735 10.4225 23.8721C10.4233 23.8703 10.4249 23.8677 10.4275 23.865C10.4302 23.8624 10.4328 23.8608 10.4346 23.86C10.436 23.8595 10.4367 23.8594 10.4375 23.8594H25.5625C25.5633 23.8594 25.564 23.8595 25.5654 23.86C25.5672 23.8608 25.5698 23.8624 25.5725 23.865C25.5751 23.8677 25.5767 23.8703 25.5775 23.8721C25.578 23.8735 25.5781 23.8742 25.5781 23.875C25.5781 23.8758 25.578 23.8765 25.5775 23.8779C25.5767 23.8797 25.5751 23.8823 25.5725 23.885C25.5698 23.8876 25.5672 23.8892 25.5654 23.89C25.564 23.8905 25.5633 23.8906 25.5625 23.8906Z"
                                                            fill="#33B938" stroke="#33B938"/>
                                                    <path
                                                            d="M18.058 10.691C18.0659 10.6923 18.0707 10.6934 18.0725 10.6939L24.2562 13.1674C24.2675 13.1719 24.302 13.1932 24.335 13.2419C24.368 13.2904 24.375 13.33 24.375 13.3425V15.625C24.375 15.727 24.2895 15.8125 24.1875 15.8125H11.8125C11.7105 15.8125 11.625 15.727 11.625 15.625V13.3425C11.625 13.33 11.632 13.2904 11.665 13.2419C11.698 13.1932 11.7325 13.1719 11.7438 13.1674L17.9275 10.6939C17.9293 10.6934 17.9341 10.6923 17.942 10.691C17.9573 10.6886 17.9775 10.6869 18 10.6869C18.0225 10.6869 18.0427 10.6886 18.058 10.691ZM16.4688 13.5625C16.4688 14.4093 17.1532 15.0938 18 15.0938C18.8468 15.0938 19.5312 14.4093 19.5312 13.5625C19.5312 12.7157 18.8468 12.0313 18 12.0313C17.1532 12.0313 16.4688 12.7157 16.4688 13.5625Z"
                                                            fill="#33B938" stroke="#33B938"/>
                                                </svg>
                                                Bank Transfer
                                            </td>
                                            <td>Jan 01,2022</td>
                                            <td>$2,000.00</td>
                                            <td>
                                                <svg class="status" width="16" height="16" viewBox="0 0 16 16"
                                                     fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <rect width="16" height="16" rx="8" fill="#BCE455"
                                                          fill-opacity="0.3"/>
                                                    <circle cx="8" cy="8" r="4" fill="#7FB519"/>
                                                </svg>
                                                Completed
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <svg width="36" height="36" viewBox="0 0 36 36" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <circle cx="18" cy="18" r="18" fill="#EBF4FF"/>
                                                    <g clip-path="url(#clip0_129_9482)">
                                                        <path
                                                                d="M23.9945 10.0539C23.0966 9.03042 21.4735 8.59164 19.3971 8.59164H13.3706C13.1652 8.59165 12.9665 8.66495 12.8102 8.79835C12.654 8.93176 12.5505 9.11653 12.5183 9.31943L10.009 25.234C9.95908 25.5479 10.2021 25.832 10.5202 25.832H14.2407L15.1751 19.9054L15.1461 20.091C15.2126 19.6721 15.5709 19.3631 15.9952 19.3631H17.7632C21.2364 19.3631 23.9559 17.9524 24.7504 13.8714C24.7739 13.7507 24.7944 13.6333 24.812 13.5185C24.7118 13.4654 24.7118 13.4654 24.812 13.5185C25.0486 12.0101 24.8104 10.9834 23.9945 10.0539Z"
                                                                fill="#27346A"/>
                                                        <path
                                                                d="M16.5987 12.9751C16.7004 12.9267 16.8116 12.9016 16.9243 12.9017H21.6489C22.2084 12.9017 22.7302 12.9381 23.2071 13.0148C23.3405 13.0361 23.4733 13.0615 23.6051 13.091C23.792 13.1322 23.9768 13.1827 24.1587 13.2422C24.3931 13.3205 24.6114 13.4117 24.8121 13.5185C25.0486 12.0096 24.8104 10.9834 23.9945 10.0539C23.0961 9.03042 21.4735 8.59164 19.3971 8.59164H13.3701C12.9458 8.59164 12.5848 8.90057 12.5183 9.31943L10.009 25.2335C9.95908 25.5478 10.2021 25.8316 10.5196 25.8316H14.2407L16.1792 13.5383C16.1983 13.4175 16.2464 13.3031 16.3195 13.205C16.3926 13.1069 16.4884 13.028 16.5987 12.9751Z"
                                                                fill="#27346A"/>
                                                        <path
                                                                d="M24.7503 13.8714C23.9559 17.9518 21.2364 19.3631 17.7632 19.3631H15.9947C15.5704 19.3631 15.212 19.6721 15.1461 20.091L13.9837 27.4601C13.9402 27.7347 14.1526 27.9836 14.4305 27.9836H17.5668C17.7465 27.9835 17.9202 27.9194 18.0568 27.8027C18.1934 27.686 18.2839 27.5244 18.3119 27.3469L18.3425 27.1871L18.9336 23.4408L18.9717 23.2338C18.9997 23.0563 19.0902 22.8947 19.2268 22.778C19.3634 22.6613 19.5371 22.5971 19.7167 22.5971H20.1861C23.2243 22.5971 25.6032 21.3628 26.2984 17.7931C26.5886 16.3013 26.4384 15.0558 25.6708 14.1809C25.438 13.916 25.1488 13.6971 24.812 13.5185C24.7938 13.6338 24.774 13.7507 24.7503 13.8714Z"
                                                                fill="#2790C3"/>
                                                        <path
                                                                d="M23.98 13.187C23.8562 13.1508 23.7311 13.1188 23.6051 13.091C23.4732 13.062 23.3405 13.0368 23.2071 13.0154C22.7297 12.9381 22.2083 12.9016 21.6483 12.9016H16.9242C16.8115 12.9014 16.7002 12.9267 16.5986 12.9757C16.4882 13.0284 16.3923 13.1072 16.3192 13.2053C16.2461 13.3035 16.198 13.418 16.1791 13.5389L15.175 19.9054L15.146 20.091C15.212 19.6721 15.5703 19.3631 15.9947 19.3631H17.7632C21.2364 19.3631 23.9559 17.9524 24.7503 13.8714C24.7739 13.7507 24.7938 13.6338 24.812 13.5185C24.6108 13.4123 24.3931 13.3205 24.1586 13.2428C24.0994 13.2231 24.0399 13.2046 23.9801 13.187"
                                                                fill="#1F264F"/>
                                                    </g>
                                                    <defs>
                                                        <clipPath id="clip0_129_9482">
                                                            <rect width="16.4967" height="19.4609" fill="white"
                                                                  transform="translate(10 8.53906)"/>
                                                        </clipPath>
                                                    </defs>
                                                </svg>
                                                Paypal Account
                                            </td>
                                            <td>Jan 04,2022</td>
                                            <td>$2,000.00</td>
                                            <td>
                                                <svg class="status" width="16" height="16" viewBox="0 0 16 16"
                                                     fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <rect width="16" height="16" rx="8" fill="#DBA32A"
                                                          fill-opacity="0.14"/>
                                                    <circle cx="8" cy="8" r="4" fill="#DBA32A"/>
                                                </svg>
                                                Pending
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <svg width="36" height="36" viewBox="0 0 36 36" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <circle cx="18" cy="18" r="18" fill="#EAECF1"/>
                                                    <g clip-path="url(#clip0_129_9497)">
                                                        <path
                                                                d="M14.6667 30C16.6907 30 18.3333 28.3573 18.3333 26.3333V22.6667H14.6667C12.6427 22.6667 11 24.3093 11 26.3333C11 28.3573 12.6427 30 14.6667 30Z"
                                                                fill="#0ACF83"/>
                                                        <path
                                                                d="M11 19C11 16.976 12.6427 15.3333 14.6667 15.3333H18.3333V22.6667H14.6667C12.6427 22.6667 11 21.024 11 19Z"
                                                                fill="#A259FF"/>
                                                        <path
                                                                d="M11 11.6667C11 9.64267 12.6427 8 14.6667 8H18.3333V15.3333H14.6667C12.6427 15.3333 11 13.6907 11 11.6667Z"
                                                                fill="#F24E1E"/>
                                                        <path
                                                                d="M18.3335 8H22.0002C24.0242 8 25.6668 9.64267 25.6668 11.6667C25.6668 13.6907 24.0242 15.3333 22.0002 15.3333H18.3335V8Z"
                                                                fill="#FF7262"/>
                                                        <path
                                                                d="M25.6668 19C25.6668 21.024 24.0242 22.6667 22.0002 22.6667C19.9762 22.6667 18.3335 21.024 18.3335 19C18.3335 16.976 19.9762 15.3333 22.0002 15.3333C24.0242 15.3333 25.6668 16.976 25.6668 19Z"
                                                                fill="#1ABCFE"/>
                                                    </g>
                                                    <defs>
                                                        <clipPath id="clip0_129_9497">
                                                            <rect width="14.6667" height="22" fill="white"
                                                                  transform="translate(11 8)"/>
                                                        </clipPath>
                                                    </defs>
                                                </svg>
                                                Bank Transfer
                                            </td>
                                            <td>Jan 06,2022</td>
                                            <td>$2,000.00</td>
                                            <td>
                                                <svg class="status" width="16" height="16" viewBox="0 0 16 16"
                                                     fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <rect width="16" height="16" rx="8" fill="#DB2719"
                                                          fill-opacity="0.3"/>
                                                    <circle cx="8" cy="8" r="4" fill="#DB2719"/>
                                                </svg>
                                                On Hold
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="bottom-container__right">
                                <div class="box">
                                    <div class="header-container">
                                        <h3 class="section-header">8월 사용금액</h3>
<%--                                        <svg width="24" height="25" viewBox="0 0 24 25" fill="none"--%>
<%--                                             xmlns="http://www.w3.org/2000/svg">--%>
<%--                                            <path--%>
<%--                                                    d="M5 10.4166C3.9 10.4166 3 11.3541 3 12.5C3 13.6458 3.9 14.5833 5 14.5833C6.1 14.5833 7 13.6458 7 12.5C7 11.3541 6.1 10.4166 5 10.4166Z"--%>
<%--                                                    stroke="#1A202C" stroke-width="1.5"/>--%>
<%--                                            <path--%>
<%--                                                    d="M19 10.4166C17.9 10.4166 17 11.3541 17 12.5C17 13.6458 17.9 14.5833 19 14.5833C20.1 14.5833 21 13.6458 21 12.5C21 11.3541 20.1 10.4166 19 10.4166Z"--%>
<%--                                                    stroke="#1A202C" stroke-width="1.5"/>--%>
<%--                                            <path--%>
<%--                                                    d="M12 10.4166C10.9 10.4166 10 11.3541 10 12.5C10 13.6458 10.9 14.5833 12 14.5833C13.1 14.5833 14 13.6458 14 12.5C14 11.3541 13.1 10.4166 12 10.4166Z"--%>
<%--                                                    stroke="#1A202C" stroke-width="1.5"/>--%>
<%--                                        </svg>--%>
                                    </div>
                                    <h1 class="price"><fmt:formatNumber value="${credit_total}"
                                                                        groupingUsed="true"/><span class="price-currency">(원)</span></h1>
                                    <p>From Jan 01, 2022 to Jan 31, 2022</p>
                                    <div class="button-box">
                                        <button class="btn btn-purple">
                                            <svg width="23" height="23" viewBox="0 0 23 23" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                        d="M9.104 13.1771C9.104 14.1066 9.82277 14.8541 10.7044 14.8541H12.5061C13.2727 14.8541 13.8957 14.2025 13.8957 13.3879C13.8957 12.5158 13.5123 12.1996 12.9469 11.9983L10.0623 10.9921C9.49692 10.7908 9.1136 10.4841 9.1136 9.60248C9.1136 8.79748 9.7365 8.13623 10.5032 8.13623H12.3048C13.1865 8.13623 13.9053 8.88373 13.9053 9.81331"
                                                        stroke="white" stroke-width="1.5" stroke-linecap="round"
                                                        stroke-linejoin="round"/>
                                                <path d="M11.5 7.1875V15.8125" stroke="white" stroke-width="1.5"
                                                      stroke-linecap="round" stroke-linejoin="round"/>
                                                <path
                                                        d="M21.0832 11.5C21.0832 16.79 16.7898 21.0833 11.4998 21.0833C6.20984 21.0833 1.9165 16.79 1.9165 11.5C1.9165 6.20996 6.20984 1.91663 11.4998 1.91663"
                                                        stroke="white" stroke-width="1.5" stroke-linecap="round"
                                                        stroke-linejoin="round"/>
                                                <path d="M16.2915 2.875V6.70833H20.1248" stroke="white"
                                                      stroke-width="1.5"
                                                      stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M21.0832 1.91663L16.2915 6.70829" stroke="white"
                                                      stroke-width="1.5"
                                                      stroke-linecap="round" stroke-linejoin="round"/>
                                            </svg>
                                            <span>Top Up</span>
                                        </button>
                                        <button class="btn btn-white">
                                            <svg width="23" height="23" viewBox="0 0 23 23" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                        d="M9.104 13.1771C9.104 14.1066 9.82277 14.8541 10.7044 14.8541H12.5061C13.2727 14.8541 13.8957 14.2025 13.8957 13.3879C13.8957 12.5158 13.5123 12.1996 12.9469 11.9983L10.0623 10.9921C9.49692 10.7908 9.1136 10.4841 9.1136 9.60248C9.1136 8.79748 9.7365 8.13623 10.5032 8.13623H12.3048C13.1865 8.13623 13.9053 8.88373 13.9053 9.81331"
                                                        stroke="#1A202C" stroke-width="1.5" stroke-linecap="round"
                                                        stroke-linejoin="round"/>
                                                <path d="M11.5 7.1875V15.8125" stroke="#1A202C" stroke-width="1.5"
                                                      stroke-linecap="round" stroke-linejoin="round"/>
                                                <path
                                                        d="M21.0832 11.5C21.0832 16.79 16.7898 21.0833 11.4998 21.0833C6.20984 21.0833 1.9165 16.79 1.9165 11.5C1.9165 6.20996 6.20984 1.91663 11.4998 1.91663"
                                                        stroke="#1A202C" stroke-width="1.5" stroke-linecap="round"
                                                        stroke-linejoin="round"/>
                                                <path d="M21.0833 5.74996V1.91663H17.25" stroke="#1A202C"
                                                      stroke-width="1.5"
                                                      stroke-linecap="round" stroke-linejoin="round"/>
                                                <path d="M16.2915 6.70829L21.0832 1.91663" stroke="#1A202C"
                                                      stroke-width="1.5" stroke-linecap="round"
                                                      stroke-linejoin="round"/>
                                            </svg>
                                            <span>Transfer</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="box spending-box">
                                    <div class="header-container">
                                        <h3 class="section-header">Spend by category</h3>
                                        <svg width="24" height="25" viewBox="0 0 24 25" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                    d="M5 10.4166C3.9 10.4166 3 11.3541 3 12.5C3 13.6458 3.9 14.5833 5 14.5833C6.1 14.5833 7 13.6458 7 12.5C7 11.3541 6.1 10.4166 5 10.4166Z"
                                                    stroke="#1A202C" stroke-width="1.5"/>
                                            <path
                                                    d="M19 10.4166C17.9 10.4166 17 11.3541 17 12.5C17 13.6458 17.9 14.5833 19 14.5833C20.1 14.5833 21 13.6458 21 12.5C21 11.3541 20.1 10.4166 19 10.4166Z"
                                                    stroke="#1A202C" stroke-width="1.5"/>
                                            <path
                                                    d="M12 10.4166C10.9 10.4166 10 11.3541 10 12.5C10 13.6458 10.9 14.5833 12 14.5833C13.1 14.5833 14 13.6458 14 12.5C14 11.3541 13.1 10.4166 12 10.4166Z"
                                                    stroke="#1A202C" stroke-width="1.5"/>
                                        </svg>
                                    </div>
                                    <div class="pie-chart">
                                        <canvas id="deductionChart2" height="220px" width="220px"></canvas>
                                     </div>



                                    <script src="../../resources/js/deductionChart.js"></script>
                                    <!-- Chart.js 및 Datalabels 플러그인 추가 -->
                                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                                    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>

                                    <div class="overall-spending">
                                        <h4>Overall Spending</h4>
                                        <span><fmt:formatNumber value="${credit_total}"
                                                                groupingUsed="true"/> 원</span>
                                    </div>
                                    <div class="pie-chart__labels">
                                        <div class="pie-chart__labels-item">
                                            <div class="label">
                                                <div class="label__color first"></div>
                                                Employees Salary
                                            </div>
                                            $8.000.00
                                        </div>
                                        <div class="pie-chart__labels-item">
                                            <div class="label">
                                                <div class="label__color second"></div>
                                                Material Supplies
                                            </div>
                                            $2.130.00
                                        </div>
                                        <div class="pie-chart__labels-item">
                                            <div class="label">
                                                <div class="label__color third"></div>
                                                Company tax
                                            </div>
                                            $1.510.00
                                        </div>
                                        <div class="pie-chart__labels-item">
                                            <div class="label">
                                                <div class="label__color fourth"></div>
                                                Maintenance system
                                            </div>
                                            $2.245.00
                                        </div>
                                        <div class="pie-chart__labels-item">
                                            <div class="label">
                                                <div class="label__color fifth"></div>
                                                Development System
                                            </div>
                                            $4.385.00
                                        </div>
                                        <div class="pie-chart__labels-item">
                                            <div class="label">
                                                <div class="label__color sixth"></div>
                                                Production Tools
                                            </div>
                                            $1.000.00
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    </main>

    </div>


<script>
    const slideContainer = document.querySelector(".slideshowContents");
    const slides = document.querySelectorAll(".slide");
    const prevButton = document.querySelector(".lastSlide");
    const nextButton = document.querySelector(".nextSlide");

    let currentSlide = 0;

    function updateButtonVisibility() {
        prevButton.style.display = currentSlide === 0 ? "none" : "block";
        nextButton.style.display =
            currentSlide === slides.length - 1 ? "none" : "block";
    }

    function goToSlide(index) {
        currentSlide = index;
        // Get width of a slide
        const slideWidth = slides[0].clientWidth;
        const translateX = -index * slideWidth;
        slideContainer.style.transform = `translateX(${translateX}px)`;
        updateButtonVisibility(); // Update button visibility after changing slide
    }

    prevButton.addEventListener("click", () => {
        currentSlide = Math.max(currentSlide - 1, 0);
        goToSlide(currentSlide);
    });

    nextButton.addEventListener("click", () => {
        currentSlide = Math.min(currentSlide + 1, slides.length - 1);
        goToSlide(currentSlide);
    });

    window.addEventListener("resize", () => {
        // Recalculate slide width on window resize
        const slideWidth = slides[0].clientWidth;
        // Update slide position based on new width
        goToSlide(currentSlide);
    });

    updateButtonVisibility();

    goToSlide(currentSlide);


</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const ctx2 = document.getElementById('deductionChart2').getContext('2d');

        var deductionChart2 = new Chart(ctx2, {
            type: 'doughnut',
            data: {
                labels: ['신용카드 공제액', '체크카드 공제액', '현금 공제액', '남은 공제가능금액'],
                datasets: [{
                    data: [
                        ${credit_deduction},
                        ${debit_deduction},
                        ${cash_deduction},
                        ${remainingDeduction2},
                    ],
                    backgroundColor: ['#fdbebe', '#9ae7d7', '#dac3ee', '#efecec'],
                    borderColor: ['#f1f2f5', '#f1f2f5', '#f1f2f5', '#f1f2f5'],
                    circumference: 180,
                    rotation: 270,
                }]
            },
            options: {
            }
        });
    });
</script>


    <footer>
        <%@ include file="common/footer.jsp" %>

    </footer>


    <!--footer-->


</body>
</html>