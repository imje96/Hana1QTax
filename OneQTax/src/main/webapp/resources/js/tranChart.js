
<script type="text/javascript">
    let categories = [];
<c:forEach var="item" items="${categoryMonth}">
    categories.push('${item.categoryBig}'); // EL 태그를 사용하여 JavaScript 배열에 데이터 저장
</c:forEach>
    document.addEventListener('DOMContentLoaded', function () {
    const ctx2 = document.getElementById('tranChart').getContext('2d');

    var tranChart = new Chart(ctx2, {
    type: 'doughnut',
    data: {
    labels: categories,
    datasets: [{
    data: [
    ${categoryMonth[0].totalAmount},
    ${categoryMonth[1].totalAmount},
    ${categoryMonth[2].totalAmount},
    ${categoryMonth[3].totalAmount},
    ${categoryMonth[4].totalAmount},
    ${categoryMonth[5].totalAmount},
    ${categoryMonth[6].totalAmount},
    ${categoryMonth[7].totalAmount},
    ${categoryMonth[8].totalAmount},
    ${categoryMonth[9].totalAmount},
    ${categoryMonth[10].totalAmount},
    ${categoryMonth[11].totalAmount},
    ],
    backgroundColor: ['#fc91b7', '#f8d5d6', '#f8f2ce', '#d1ede5', '#aee3eb', '#e6e4dc', '#bfcaf2', '#839ee6', '#7C5CFC', '#063cbe', '#063dc2', '#0d0036'],
    borderColor: ['#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff'],
    // circumference: 180,
    rotation: 270,
}]
},
    options: {
    plugins: {
    legend: {
    display: false, // 범례를 숨김s
},
},
    tooltips: {
    enabled: true,
    callbacks: {
    label: function (tooltipItem, data) {
    let label = data.labels[tooltipItem.index];
    let value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
    return label + ': ' + value;
}
}
}
}
});
});
