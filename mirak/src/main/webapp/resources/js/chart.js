$(function () {
    $.ajax({
        url: "/admin/charts",
        async: true,
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var totalByMenuList = data["totalByMenuList"];
            var Mtotal = totalByMenuList["totalPrice"];
            var menu = totalByMenuList["pro_name"];
            
            var totalByDayList = data["totalByDayList"];
            var Dtotal = totalByDayList["totalPrice"];
            var day = totalByDayList["pay_date"];
            
            console.log(totalByMenuList)

            const ctx = document.getElementById('myChart1').getContext('2d');
            const myChart1 = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: menu,
                    datasets: [{
                        label: '메뉴 별 총 판매',
                        data: Mtotal,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(255, 159, 64, 0.2)',
                            'rgba(255, 205, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(201, 203, 207, 0.2)'
                        ],
                        borderColor: [
                            'rgb(255, 99, 132)',
                            'rgb(255, 159, 64)',
                            'rgb(255, 205, 86)',
                            'rgb(75, 192, 192)',
                            'rgb(54, 162, 235)',
                            'rgb(153, 102, 255)',
                            'rgb(201, 203, 207)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                	maintainAspectRatio :false,
                    responsive: false,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            })

            const ctx2 = document.getElementById('myChart2').getContext('2d');
            const myChart2 = new Chart(ctx2, {
                type: 'line',
                data: {
                    labels: day,
                    datasets: [{
                        label: '일자 별 총 판매',
                        data: Dtotal,
                        tension: 0.1
                    }]
                },
                options: {
                	maintainAspectRatio :false,
                    responsive: false,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            }

            )
        }
    })
});    