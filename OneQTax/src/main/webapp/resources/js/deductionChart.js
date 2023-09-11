document.addEventListener('DOMContentLoaded', function() {
    var ctx = document.getElementById('deductionChart').getContext('2d');
    var chart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['신용카드 공제액', '체크카드 공제액', '현금 공제액', '남은 공제금액'],
            datasets: [{
                data: [
                    window.creditDeduction,
                    window.debitDeduction,
                    window.cashDeduction,
                    window.remainingDeduction
                ],
                backgroundColor: ['#ffeb9b', '#b5f2ff', '#c5f2ba', '#e7dfdf'],
                borderColor: ['#ffeb9b', '#b5f2ff', '#c5f2ba', '#e7dfdf'],
                circumference: 180, // 도넛 반 자르기
                rotation: 270, // 도넛 돌리기
            }]
        },
        options: {
            tooltips: {
                callbacks: {
                    label: function (tooltipItem, data) {
                        let label = data.labels[tooltipItem.index] || '';
                        let value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
                        return label + ': ' + value.toLocaleString('ko-KR') + '원'; // 포맷을 'ko-KR'로 설정하여 금액을 한국식 포맷으로 표시
                    }
                }
            }
        }
    });
})
