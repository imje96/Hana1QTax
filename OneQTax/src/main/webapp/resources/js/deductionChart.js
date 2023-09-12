document.addEventListener('DOMContentLoaded', function() {
    var canvas = document.getElementById('deductionChart');
    canvas.setAttribute('width', '300')
    canvas.setAttribute('height', '300')

    var ctx = document.getElementById('deductionChart').getContext('2d');

    // 가운데 퍼센트 추가
    let totalAmount = window.creditDeduction + window.debitDeduction + window.cashDeduction;
    let fullAmount = 3000000;
    let percentage = (totalAmount / fullAmount) * 100;


    var chart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['신용카드 공제액', '체크카드 공제액', '현금 공제액', '추가 공제액', '남은 공제가능금액'],
            datasets: [{
                data: [
                    window.creditDeduction,
                    window.debitDeduction,
                    window.cashDeduction,
                    window.additional,
                    window.remainingDeduction
                ],
                backgroundColor: ['#ffeb9b', '#b5f2ff', '#c5f2ba', '#d595ce', '#efecec'],
                borderColor: ['#ffeb9b', '#b5f2ff', '#c5f2ba', '#d595ce', '#efecec'],

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
                        return label + ': ' + value.toLocaleString('ko-KR') + "원"; // 포맷을 'ko-KR'로 설정하여 금액을 한국식 포맷으로 표시
                    }
                }
            }
        }
    });
})
