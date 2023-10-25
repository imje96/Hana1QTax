document.addEventListener('DOMContentLoaded', function() {
    const ctx1 = document.getElementById('threshold1').getContext('2d');

    var totalUsed = window.creditTotal + window.debitTotal + window.cashTotal;
    var totalAmount = totalUsed + window.remainingThreshold;
    var percentage = Math.round((totalUsed / totalAmount) * 100);


    var threshold1 = new Chart(ctx1, {
        type: 'doughnut',
        data: {
            labels: ['신용카드 사용액', '체크카드 사용액', '현금 사용액' /*, '남은 금액'*/],
            datasets: [{
                data: [
                    window.creditTotal,
                    window.debitTotal,
                    window.cashTotal,
                    // window.remainingThreshold,
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
                    },
                },
                layout: {
                    padding: {
                        top: 10, // 그래프 영역의 위쪽 여백 조절
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
});



