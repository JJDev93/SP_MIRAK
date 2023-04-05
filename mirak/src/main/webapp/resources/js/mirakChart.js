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

      function addCommas(num) {
        return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      }

      document.querySelector(".totalPrice_title").textContent = addCommas(
        chartMainList.totalPrice
      );
      document.querySelector(".monthPrice_title").textContent = addCommas(
        chartMainList.monthPrice
      );
      document.querySelector(".totalUsers_title").textContent = addCommas(
        chartMainList.totalUsers
      );

      const ctx1 = document.getElementById("myChart1").getContext("2d");
      const ctx4 = document.getElementById("myChart4").getContext("2d");

      const purchaseRateData = {
        datasets: [
          {
            type: "bar",
            label: "장바구니에 담긴 횟수",
            data: purchaseRateList.cart_cnt,
            borderColor: "rgba(255, 99, 132, 0.2)",
            backgroundColor: "#51CACF",
            borderWidth: 1,
            order: 1,
            datalabels: {
              color: function (context) {
                var index = context.dataIndex;
                var value = purchaseRateList.rec[index];
                if (value === "대박!") {
                  return "red";
                }if (value === "강추") {
                  return "blue";
                }  else {
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
            borderColor: "rgba(255, 99, 132, 0.2)",
            backgroundColor: "#dc3545",
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
              label: "Menus",
              pointRadius: 0,
              pointHoverRadius: 0,
              backgroundColor: [
                "#fb8622",
                "#ffc107",
                "#dc3545",
                "#6c757d",
                "#51CACF",
              ],
              borderWidth: 1,
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

      const femaleDates = totalUsersList.여자.regdate;
      const maleDates = totalUsersList.남자.regdate;

      const uniqueDates = [...new Set([...femaleDates, ...maleDates])].map(
        (date) => date.substr(5, 5)
      );

      var speedData = {
        labels: uniqueDates,
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

      var bestByGenderList = data["bestByGenderList"];
      
      var sortedAgeGroups = Object.keys(bestByGenderList).sort();

      var sortedBestByGenderList = {};
      sortedAgeGroups.forEach(function (ageGroup) {
      sortedBestByGenderList[ageGroup] = bestByGenderList[ageGroup];
      });

      var ctx2 = document.getElementById("myChart2").getContext("2d");

      var data = {
        labels: sortedBestByGenderList["10대"]["pro_name"],
        datasets: [
          {
            label: "10대",
            data: sortedBestByGenderList["10대"]["total_Price"].map(
              (price, index) =>
                (price / 100) * sortedBestByGenderList["10대"]["ratio"][index]
            ),
            backgroundColor: "#ffc107",
            borderColor: "white",
            borderWidth: 1,
          },
          {
            label: "20대",
            data: sortedBestByGenderList["20대"]["total_Price"].map(
              (price, index) =>
                (price / 100) * sortedBestByGenderList["20대"]["ratio"][index]
            ),
            backgroundColor: "#fb8622",
            borderColor: "white",
            borderWidth: 1,
          },
          {
            label: "30대",
            data: sortedBestByGenderList["30대"]["total_Price"].map(
              (price, index) =>
                (price / 100) * sortedBestByGenderList["30대"]["ratio"][index]
            ),
            backgroundColor: "#51CACF",
            borderColor: "white",
            borderWidth: 1,
          },
          {
            label: "40대",
            data: sortedBestByGenderList["40대"]["total_Price"].map(
              (price, index) =>
                (price / 100) * sortedBestByGenderList["40대"]["ratio"][index]
            ),
            backgroundColor: "#6c757d",
            borderColor: "white",
            borderWidth: 1,
          },
          {
            label: "50대",
            data: sortedBestByGenderList["50대"]["total_Price"].map(
              (price, index) =>
                (price / 100) * sortedBestByGenderList["50대"]["ratio"][index]
            ),
            backgroundColor: "#dc3545",
            borderColor: "white",
            borderWidth: 1,
          },
        ],
      };

      var options = {
        responsive: false,
        plugins: {
          legend: {
            display: false,
          },
          datalabels: {
            color: "#fff",
            font: {
              weight: "bold",
              size: "14",
            },
            formatter: function (value, context) {
              var ageGroups = Object.keys(sortedBestByGenderList);
              var ratiosByMenu = {};
              ageGroups.forEach(function (ageGroup) {
                var proNames = sortedBestByGenderList[ageGroup]["pro_name"];
                console.log(proNames);
                var ratios = sortedBestByGenderList[ageGroup]["ratio"];
                console.log(ratios);
                for (var i = 0; i < proNames.length; i++) {
                  var proName = proNames[i];
                  var ratio = ratios[i];
                  if (!(proName in ratiosByMenu)) {
                    ratiosByMenu[proName] = Array(ageGroups.length).fill(null);
                  }
                  var ageIndex = ageGroups.indexOf(ageGroup);
                  ratiosByMenu[proName][ageIndex] = ratio;
                }
              });

              var proNames = Object.keys(ratiosByMenu);
              var proName = proNames[context.dataIndex];
              var ratios = ratiosByMenu[proName];

              if (ratios) {
                var sortedRatios = ratios.slice().sort(function (a, b) {
                  return b - a;
                });
                var maxRatioIndex = ratios.indexOf(sortedRatios[0]);
                var secondMaxRatioIndex = ratios.indexOf(sortedRatios[1]);

                if (context.datasetIndex === maxRatioIndex) {
                  return sortedRatios[0].toFixed(1) + "%";
                } else if (context.datasetIndex === secondMaxRatioIndex) {
                  return sortedRatios[1].toFixed(1) + "%";
                } else {
                  return "";
                }
              } else {
                return "";
              }
            },
          },
          tooltip: {
            callbacks: {
              label: function (context) {
                var label = context.dataset.label || "";
                if (label) {
                  label += ": ";
                }
                if (context.parsed.y !== null) {
                  label += Math.ceil(context.parsed.y);
                }
                return label;
              },
            },
          },
        },
        scales: {
          y: {
            stacked: true,
            ticks: {
              beginAtZero: true,
            },
          },
          x: {
            stacked: true,
            ticks: {
              autoSkip: false,
            },
          },
        },
      };

      var myChart2 = new Chart(ctx2, {
        type: "bar",
        data: data,
        options: options,
        plugins: [ChartDataLabels],
      });
    },
  });
});
