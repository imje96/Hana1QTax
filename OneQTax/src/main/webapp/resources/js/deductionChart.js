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
                backgroundColor: ['#ffeb9b', '#b5f2ff', '#c5f2ba','#efecec'],
                borderColor: ['#ffeb9b', '#b5f2ff', '#c5f2ba', '#efecec'],
                circumference: 180,
                rotation: 270,
            }]
        },
        options: {
            plugins: {
                legend: {
                    position: 'bottom' // 여기를 추가
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
                backgroundColor: ['#ffeb9b'],
                borderColor: ['#ffeb9b'],
            },
                {
                    label: '추가공제액',
                    data: [window.additionalDeduction],
                    backgroundColor: ['#b5f2ff'],
                    borderColor: ['#b5f2ff'],
                },
                {
                    label: '남은공제액',
                    data: [window.total - window.basicDeduction - window.additionalDeduction],
                    backgroundColor: ['#edebeb'],
                    borderColor: ['#edebeb'],
                }
            ]
        },

        options: {

            responsive: false,
            maintainAspectRatio: false,
            scales: {
                x: {
                    display: true,
                    stacked: true,
                    grid: {
                        display: false,
                        drawOnChartArea: false, // x축의 선을 제거합니다.
                        drawBorder: false      // x축의 경계선도 제거합니다.
                    },
                    ticks: {
                        display: true,
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
                    position: 'bottom'
                },
                datalabels: {
                    color: 'black',
                    formatter: function(value, context) {
                        return ((value / totalDeductions) * 100).toFixed(2) + '%';
                    },
                    anchor: 'end',
                    align: 'top',
                }
            }
        }
    });
});
