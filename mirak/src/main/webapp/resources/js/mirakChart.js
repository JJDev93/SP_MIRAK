$(function () {
  $.ajax({
    url: "/admin/charts",
    async: true,
    type: "POST",
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    success: function (data) {
      var totalByMenuList = data["totalByMenuList"];
      var purchaseRateList = data["purchaseRateList"];
      var totalUsersList = data["totalUsersList"];
      var chartMainList = data["chartMainList"];
      var totalRatio = totalByMenuList.totalRatio;

      document.querySelector(".totalPrice_title").textContent =
        chartMainList.totalPrice;
      document.querySelector(".monthPrice_title").textContent =
        chartMainList.monthPrice;
      document.querySelector(".totalUsers_title").textContent =
        chartMainList.totalUsers;

      const ctx1 = document.getElementById("myChart1").getContext("2d");
      const ctx4 = document.getElementById("myChart4").getContext("2d");

      const purchaseRateData = {
        datasets: [
          {
            type: "bar",
            label: "장바구니에 담긴 횟수",
            data: purchaseRateList.cart_cnt,
            borderColor: "#696969",
            backgroundColor: "#87CEFA",
            borderWidth: 1,
            order: 1,
            datalabels: {
              color: function (context) {
                var index = context.dataIndex;
                var value = purchaseRateList.rec[index];
                if (value === "강추") {
                  return "red";
                } else {
                  return "black";
                }
              },
              font: {
                weight: "bold",
              },
              anchor: "begin",
              align: "middle",
              formatter: function (value, context) {
                var index = context.dataIndex;
                var ratio = purchaseRateList.ratio[index];
                var rec = purchaseRateList.rec[index];
                return ratio.toFixed(1) + "%\n\n" + rec;
              },
            },
          },
          {
            type: "bar",
            label: "실제 구매횟수",
            data: purchaseRateList.cart_show,
            borderColor: "#696969",
            backgroundColor: "#F08080",
            borderWidth: 1,
            order: 2,
            datalabels: {
              display: false,
            },
          },
        ],
        labels: purchaseRateList.pro_name,
      };

      const purchaseRateOpt = {
        maintainAspectRatio: false,
        responsive: false,
        plugins: {
          legend: {
            display: false,
          },
        },
        scales: {
          y: {
            beginAtZero: true,
          },
        },
      };

      const myChart1 = new Chart(ctx1, {
        type: "bar",
        data: purchaseRateData,
        options: purchaseRateOpt,
        plugins: [ChartDataLabels],
      });

      var totalpie = document.getElementById("myChart4");

      myChart = new Chart(totalpie, {
        type: "pie",
        plugins: [ChartDataLabels],
        data: {
          labels: totalByMenuList.pro_name,
          datasets: [
            {
              label: "Emails",
              pointRadius: 0,
              pointHoverRadius: 0,
              backgroundColor: [
                "#fb8622",
                "#ffc107",
                "#dc3545",
                "#212529",
                "#17a2b8",
              ],
              borderWidth: 0,
              data: totalByMenuList.totalPrice,
            },
          ],
        },

        options: {
          responsive: false,
          plugins: {
            legend: {
              display: false,
            },
            datalabels: {
              color: "#fff",
              anchor: "end",
              align: "start",
              offset: 10,
              font: {
                weight: "bold",
                size: "14",
              },
              formatter: function (value, context) {
                var totalRatio = totalByMenuList.totalRatio;
                return totalRatio[context.dataIndex].toFixed(1) + "%";
              },
            },
          },
          tooltips: {
            enabled: false,
          },
          scales: {
            yAxes: [
              {
                ticks: {
                  display: false,
                },
                gridLines: {
                  drawBorder: false,
                  zeroLineColor: "transparent",
                  color: "rgba(255,255,255,0.05)",
                },
              },
            ],
            xAxes: [
              {
                barPercentage: 1.6,
                gridLines: {
                  drawBorder: false,
                  color: "rgba(255,255,255,0.1)",
                  zeroLineColor: "transparent",
                },
                ticks: {
                  display: false,
                },
              },
            ],
          },
        },
      });

      document.querySelector(".menu1").textContent =
        totalByMenuList.pro_name[0];
      document.querySelector(".menu2").textContent =
        totalByMenuList.pro_name[1];
      document.querySelector(".menu3").textContent =
        totalByMenuList.pro_name[2];
      document.querySelector(".menu4").textContent =
        totalByMenuList.pro_name[3];
      document.querySelector(".menu5").textContent =
        totalByMenuList.pro_name[4];

      var gender_ratio = document.getElementById("myChart5");

      var dataFirst = {
        label: "여자",
        data: totalUsersList.여자.totalUsers,
        fill: false,
        borderColor: "#dc3545",
        backgroundColor: "transparent",
        pointBorderColor: "#dc3545",
        pointRadius: 4,
        pointHoverRadius: 4,
        pointBorderWidth: 8,
      };

      var dataSecond = {
        label: "남자",
        data: totalUsersList.남자.totalUsers,
        fill: false,
        borderColor: "#51CACF",
        backgroundColor: "transparent",
        pointBorderColor: "#51CACF",
        pointRadius: 4,
        pointHoverRadius: 4,
        pointBorderWidth: 8,
      };

      var speedData = {
        labels: totalUsersList.여자.regdate,
        datasets: [dataFirst, dataSecond],
      };

      var chartOptions = {
        plugins: {
          legend: {
            display: false,
          },
        },
      };

      var lineChart = new Chart(gender_ratio, {
        type: "line",
        hover: false,
        data: speedData,
        options: chartOptions,
      });
    },
  });
});
