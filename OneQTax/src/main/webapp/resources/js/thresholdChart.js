document.addEventListener('DOMContentLoaded', function() {
    const ctx1 = document.getElementById('threshold1').getContext('2d');

    var totalUsed = window.creditTotal + window.debitTotal + window.cashTotal;
    var totalAmount = totalUsed + window.remainingThreshold;
    var percentage = Math.round((totalUsed / totalAmount) * 100);

    // Check if the plugin is already registered
    // var pluginExists = Chart.plugins.getAll().some(plugin => plugin.id === 'customDoughnutPlugin');
    //
    // if (!pluginExists) {
    //     Chart.plugins.register({
    //         id: 'customDoughnutPlugin',
    //         beforeDraw: function(chart) {
    //             if (chart.config.type !== 'doughnut') return;
    //
    //             var ctx = chart.chart.ctx;
    //             ctx.save();
    //
    //             var centerX = chart.chartArea.left + (chart.chartArea.right - chart.chartArea.left) / 2;
    //             var centerY = chart.chartArea.top + (chart.chartArea.bottom - chart.chartArea.top) / 2;
    //
    //             ctx.textAlign = 'center';
    //             ctx.textBaseline = 'middle';
    //             ctx.font = 'bold 20px Arial';
    //             ctx.fillStyle = '#000';
    //             ctx.fillText(percentage + '%', centerX, centerY);
    //
    //             ctx.restore();
    //         }
    //     });
    // }
    var threshold1 = new Chart(ctx1, {
        type: 'doughnut',
        data: {
            labels: ['신용카드 사용액', '체크카드 사용액', '현금 사용액', '남은 금액'],
            datasets: [{
                data: [
                    window.creditTotal,
                    window.debitTotal,
                    window.cashTotal,
                    window.remainingThreshold,
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



    // var deductionChart1 = new Chart(ctx1, {
    //     type: 'bar',
    //     data: {
    //         labels: ['소득공제 현황'],
    //         datasets: [{
    //             label: '신용카드사용액',
    //             data: [window.creditTotal],
    //             backgroundColor: ['#9ae7d7'],
    //             borderColor: ['#ffffff'],
    //         },
    //             {
    //                 label: '체크카드사용액',
    //                 data: [window.debitTotal],
    //                 backgroundColor: ['#b5f2ff'],
    //                 borderColor: ['#ffffff'],
    //             },
    //             {
    //                 label: '현금영수증사용액',
    //                 data: [window.cashTotal],
    //                 backgroundColor: ['#dac3ee'],
    //                 borderColor: ['#ffffff'],
    //             },
    //             {
    //                 label: '기타공제사용액',
    //                 data: [window.remainingThreshold],
    //                 backgroundColor: ['#efecec'],
    //                 borderColor: ['#ffffff'],
    //             },
                // {
                //     label: '남은사용액',
                //     data: [window.total - window.basicDeduction - window.additionalDeduction],
                //     backgroundColor: ['#edebeb'],
                //     borderColor: ['#ffffff'],
                // }
        //     ]
        // },

//         options: {
//
//             responsive: false,
//             maintainAspectRatio: false,
//             scales: {
//                 x: {
//                     display: false,
//                     stacked: true,
//                     grid: {
//                         display: false,
//                         drawOnChartArea: false, // x축의 선을 제거합니다.
//                         drawBorder: false      // x축의 경계선도 제거합니다.
//                     },
//                     ticks: {
//                         display: false,
//                         maxRotation: 0, // 레이블을 바르게 만들기 위한 설정
//                         autoSkip: false, // 레이블을 건너뛰지 않도록 설정
//                         callback: function(value, index, values) {
//                             if (index === values.length - 1) {
//                                 return window.total;
//                             }
//                             return null;
//                         }
//                     }
//                 },
//                 y: {
//                     display: false,
//                     stacked: true,
//                     grid: {
//                         display: false
//                     },
//                     ticks: {
//                         display: false
//                     }
//                 }
//             },
//             indexAxis: 'y',
//             plugins: {
//                 legend: {
//                     display: true,
//                     position: 'bottom',
//                     labels: {
//                         usePointStyle: true, // 이 설정을 사용하여 원 모양 이미지를 활성화
//                     }
//                 },
//                 // datalabels: {
//                 //     color: 'black',
//                 //     formatter: function(value, context) {
//                 //         return ((value / totalDeductions) * 100).toFixed(2) + '%';
//                 //     },
//                 //     anchor: 'end',
//                 //     align: 'top',
//                 // }
//             }
//         }
//     });
// });

// 플러그인 등록
//     Chart.register(customDoughnutPlugin);





//     var threshold1 = new Chart(ctx1, {
//         type: 'doughnut',
//         data: {
//             labels: ['신용카드 사용액', '체크카드 사용액', '현금 사용액', '남은 금액'],
//             datasets: [{
//                 data: [
//                     window.creditTotal,
//                     window.debitTotal,
//                     window.cashTotal,
//                     window.remainingThreshold,
//                 ],
//                 backgroundColor: ['#fdbebe', '#9ae7d7', '#dac3ee','#efecec'],
//                 borderColor: ['#f1f2f5', '#f1f2f5', '#f1f2f5', '#f1f2f5'],
//                 circumference: 180,
//                 rotation: 270,
//             }]
//         },
//         options: {
//             plugins: {
//                 customDoughnutPlugin: {
//                     active: true
//                 },
//                 legend: {
//                     position: 'bottom',
//                     labels: {
//                         usePointStyle: true,
//                     },
//                 },
//                 layout: {
//                     padding: {
//                         top: 10,
//                     }
//                 },
//                 tooltips: {
//                     callbacks: {
//                         label: function (tooltipItem, data) {
//                             let label = data.labels[tooltipItem.index] || '';
//                             let value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
//                             return label + ': ' + value.toLocaleString('ko-KR') + "원";
//                         }
//                     }
//                 }
//             }
//         }
//     });
// });
