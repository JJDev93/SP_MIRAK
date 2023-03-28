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

      function changeClass(element, removeClass, addClass) {
        element.classList.remove(removeClass);
        element.classList.add(addClass);
      }
      const ctx1 = document.getElementById("myChart1").getContext("2d");
      const ctx4 = document.getElementById("myChart4").getContext("2d");

      const byMenuChartData = {
        labels: totalByMenuList.pro_name,
        datasets: [
          {
            label: "판매량",
            data: totalByMenuList.totalPrice,
            backgroundColor: function (context) {
              if (context.dataIndex <= 4) {
                return [
                  "rgba(238, 32, 77, 0.8)",
                  "rgba(238, 32, 77, 0.6)",
                  "rgba(238, 32, 77, 0.4)",
                  "rgba(238, 32, 77, 0.2)",
                  "rgba(238, 32, 77, 0.1)",
                ];
              }
              return "rgba(54, 162, 235, 0.2)";
            },
            borderColor: function (context) {
              if (context.dataIndex <= 4) {
                [
                  "rgba(122, 41, 69, 0.1)",
                  "rgba(147, 68, 88, 0.1)",
                  "rgba(183, 107, 120, 0.1)",
                  "rgba(219, 156, 161, 0.1)",
                  "rgba(255, 214, 214, 0.1)",
                ];
              }
              return "rgba(102, 102, 102)";
            },
            borderWidth: 2,
            datalabels: {
              color: "black",
              font: {
                size: 14,
                weight: "bold",
              },
              anchor: "begin",
              align: "middle",
              formatter: function (value, context) {
                var index = context.dataIndex;
                var totalRatio = totalByMenuList.totalRatio[index];
                return totalRatio.toFixed(1) + "%";
              },
            },
          },
        ],
      };

      const byMenuChartDataOpt = {
        maintainAspectRatio: false,
        responsive: false,
        plugins: {
          title: {
            display: true,
            text: "판매량 TOP20",
          },
        },
        scales: {
          x: {
            font : {
              size : 8,
            }
          },
          y: {
            beginAtZero: true,
          },
        },
      };

      const myChart1 = new Chart(ctx1, {
        type: "bar",
        data: byMenuChartData,
        options: byMenuChartDataOpt,
        plugins: [ChartDataLabels],
      });

      myChart1.canvas.addEventListener("click", function (e) {
        console.log("chart1 클릭이벤트~");
        const activePoints = myChart1.getElementsAtEventForMode(
          e,
          "nearest",
          { intersect: true },
          true
        );
        if (activePoints.length > 0) {
          const clickedIndex = activePoints[0].index;
          const clickedMenu = totalByMenuList.pro_name[clickedIndex];

          let myChart2 = null,
            myChart3 = null;

          const chartWrapper1 = document.getElementById("chartWrapper1");
          const chartWrapper2 = document.getElementById("chartWrapper2");
          const chartWrapper3 = document.getElementById("chartWrapper3");
          const chartWrappers = [chartWrapper2, chartWrapper3];

          if (chartWrapper1.classList.contains("chart-visible")) {
            changeClass(chartWrapper1, "chart-visible", "chart-hidden");
            changeClass(chartWrapper2, "chart-hidden", "chart-visible");
            changeClass(chartWrapper3, "chart-hidden", "chart-visible");
          }

          chartWrappers.forEach((wrapper) => {
            wrapper.addEventListener("click", function () {
              chartWrappers.forEach((wrapper) => {
                if (wrapper.classList.contains("chart-visible")) {
                  changeClass(wrapper, "chart-visible", "chart-hidden");
                  changeClass(chartWrapper1, "chart-hidden", "chart-visible");
                }
              });

              if (myChart2 !== null) {
                myChart2.destroy();
              }
              if (myChart3 !== null) {
                myChart3.destroy();
              }
            });
          });

          const ctx2 = document.getElementById("myChart2").getContext("2d");
          const ctx3 = document.getElementById("myChart3").getContext("2d");

          $.ajax({
            type: "GET",
            url: "/admin/charts/getCountByRatio/" + clickedMenu,
            data: {
              clickedMenu: clickedMenu,
            },
            success: function (data) {
              const countByGender = data.countByGender;
              const countByAge = data.countByAge;

              const genderChartData = {
                labels: ["남성", "여성"],
                datasets: [
                  {
                    label: clickedMenu,
                    data: countByGender.countByGender,
                    backgroundColor: ["rgb(54, 162, 235)", "rgb(255, 99, 132)"],
                    hoverOffset: 4,
                  },
                ],
              };
              const genderChartDataOpt = {
                maintainAspectRatio: false,
                responsive: false,
                plugins: {
                  title: {
                    display: true,
                    text: "성별 비율",
                  },
                  datalabels: {
                    color: "#fff",
                    formatter: (value, ctx) => {
                      return value + "명";
                    },
                  },
                },
                datasets: [
                  {
                    data: countByGender.mem_gender,
                    backgroundColor: ["#007aff", "#ff2d55"],
                    label: "성별 비율",
                  },
                ],
              };

              const ageChartData = {
                labels: countByAge.mem_age,
                datasets: [
                  {
                    label: "나이대별 판매 현황",
                    data: countByAge.countByAge,
                    backgroundColor: [
                      "#007aff",
                      "#ff2d55",
                      "#ffcc00",
                      "#34c759",
                      "#5ac8fa",
                    ],
                  },
                ],
              };

              const ageChartDataOpt = {
                maintainAspectRatio: false,
                responsive: false,
                plugins: {
                  title: {
                    display: true,
                    text: "나이대별 판매 현황",
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
                    formatter: (value, ctx) => {
                      return value + "명";
                    },
                  },
                },
                datasets: [
                  {
                    data: countByAge.countByAge,
                    backgroundColor: [
                      "#007aff",
                      "#ff2d55",
                      "#ffcc00",
                      "#34c759",
                      "#5ac8fa",
                    ],
                    label: "나이대별 판매 현황",
                  },
                ],
              };
              myChart2 = new Chart(ctx2, {
                type: "doughnut",
                data: genderChartData,
                options: genderChartDataOpt,
                plugins: [ChartDataLabels],
              });
              myChart3 = new Chart(ctx3, {
                type: "pie",
                data: ageChartData,
                options: ageChartDataOpt,
                plugins: [ChartDataLabels],
              });
            },
          });
        }
      });

      const purchaseRateData = {
        datasets: [
          {
            type: "bar",
            label: "장바구니에 담긴 횟수",
            data: purchaseRateList.cart_cnt,
            borderColor: "rgba(128, 128, 128, 0.5)",
            backgroundColor: "rgba(255, 99, 132, 0.2)",
            borderWidth: 1,
            order: 1,
            datalabels: {
              color: function (context) {
                var index = context.dataIndex;
                var value = purchaseRateList.rec[index];
                if (value === "강추") {
                  return "red";
                } else {
                  return "blue";
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
            borderColor: "rgba(128, 128, 128, 0.5)",
            backgroundColor: "rgba(54, 162, 235, 0.2)",
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
          title: {
            display: true,
            text: "구매율",
          },
        },
        scales: {
          y: {
            beginAtZero: true,
          },
        },
      };

      const myChart4 = new Chart(ctx4, {
        type: "bar",
        data: purchaseRateData,
        options: purchaseRateOpt,
        plugins: [ChartDataLabels],
      });
    },
  });
});
