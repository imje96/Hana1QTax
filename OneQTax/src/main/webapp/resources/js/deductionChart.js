document.addEventListener('DOMContentLoaded', function() {
    const ctx1 = document.getElementById('deductionChart1').getContext('2d');
    const ctx2 = document.getElementById('deductionChart2').getContext('2d');

    var deductionChart2 = new Chart(ctx2, {
        type: 'doughnut',
        data: {
            labels: ['신용카드 공제액', '체크카드 공제액', '현금 공제액', '남은 공제가능금액'],
            datasets: [{
                data: [
                    window.creditDeduction,
                    window.debitDeduction,
                    window.cashDeduction,
                    window.remainingDeduction2,
                ],
                backgroundColor: ['#fdbebe', '#9ae7d7', '#dac3ee','#efecec'],
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



    var deductionChart1 = new Chart(ctx1, {
        type: 'bar',
        data: {
            labels: ['소득공제 현황'],
            datasets: [{
                label: '기본공제액',
                data: [window.basicDeduction],
                backgroundColor: ['#fdbebe'],
                borderColor: ['#f1f2f5'],
            },
                {
                    label: '추가공제액',
                    data: [window.additionalDeduction],
                    backgroundColor: ['#9ae7d7'],
                    borderColor: ['#f1f2f5'],
                },
                {
                    label: '남은공제액',
                    data: [window.total - window.basicDeduction - window.additionalDeduction],
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
                            size: 16,
                            weight: 'bold'
                        }
                    }
                },
                // datalabels: {
                //     color: 'black',
                //     formatter: function(value, context) {
                //         return ((value / totalDeductions) * 100).toFixed(2) + '%';
                //     },
                //     anchor: 'end',
                //     align: 'top',
                // }
            }
        }
    });
});
