// 배우자 공제 차트

document.addEventListener('DOMContentLoaded', function() {
    const ctx3 = document.getElementById('deductionChart3').getContext('2d');
    const ctx4 = document.getElementById('deductionChart4').getContext('2d');
    // 배우자

    var deductionChart4 = new Chart(ctx4, {
        type: 'doughnut',
        data: {
            labels: ['신용카드 공제액', '체크카드 공제액', '현금 공제액', '남은 공제가능금액'],
            datasets: [{
                data: [
                    window.creditDeduction2,
                    window.debitDeduction2,
                    window.cashDeduction2,
                    window.remainingDeduction4,
                ],
                backgroundColor: ['#000000', '#a1a1a1', '#ffffff','#efecec'],
                borderColor: ['#f1f2f5', '#f1f2f5', '#f1f2f5', '#f1f2f5'],
                circumference: 180,
                rotation: 270,
            }]
        },
        options: {
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: {
                        usePointStyle: true,
                        font: {
                            size: 16, // 여기에 fontSize를 설정합니다.
                            weight: 'bold'
                        }
                    },
                },
                layout: {
                    padding: {
                        top: 0, // 그래프 영역의 위쪽 여백 조절
                    }
                },
                tooltips: {
                    callbacks: {
                        label: function (tooltipItem, data) {
                            let label = data.labels[tooltipItem.index] || '';
                            let value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
                            return label + ': ' + value.toLocaleString('ko-KR') + "원";
                        }
                    }
                }
            }
        }
    });



    var deductionChart3 = new Chart(ctx3, {
        type: 'bar',
        data: {
            labels: ['소득공제 현황'],
            datasets: [{
                label: '기본공제액',
                data: [window.basicDeduction2],
                backgroundColor: ['#3b3a3a'],
                borderColor: ['#f1f2f5'],
            },
                {
                    label: '추가공제액',
                    data: [window.additionalDeduction2],
                    backgroundColor: ['#a1a1a1'],
                    borderColor: ['#f1f2f5'],
                },
                {
                    label: '남은공제액',
                    data: [window.total - window.basicDeduction2 - window.additionalDeduction2],
                    backgroundColor: ['#edebeb'],
                    borderColor: ['#f1f2f5'],
                }
            ]
        },

        options: {

            responsive: false,
            maintainAspectRatio: false,
            scales: {
                x: {
                    display: false,
                    stacked: true,
                    grid: {
                        display: false,
                        drawOnChartArea: false, // x축의 선을 제거합니다.
                        drawBorder: false      // x축의 경계선도 제거합니다.
                    },
                    ticks: {
                        display: false,
                        maxRotation: 0, // 레이블을 바르게 만들기 위한 설정
                        autoSkip: false, // 레이블을 건너뛰지 않도록 설정
                        callback: function(value, index, values) {
                            if (index === values.length - 1) {
                                return window.total;
                            }
                            return null;
                        }
                    }
                },
                y: {
                    display: false,
                    stacked: true,
                    grid: {
                        display: false
                    },
                    ticks: {
                        display: false
                    }
                }
            },
            indexAxis: 'y',
            plugins: {
                legend: {
                    display: true,
                    position: 'bottom',
                    labels: {
                        usePointStyle: true,
                        font: {
                            size: 16, // 여기에 fontSize를 설정합니다.
                            weight: 'bold'
                        }
                    }
                },
            }
        }
    });
});
