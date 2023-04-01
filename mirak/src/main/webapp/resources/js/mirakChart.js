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
      console.log(totalUsersList);

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
            font: {
              size: 8,
            },
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

      var totalpie = document.getElementById("myChart4");

      myChart = new Chart(totalpie, {
        type: "pie",
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
              datalabels: {
                color: "white",
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
        },

        options: {
        responsive: false,
          plugins: {
            legend: {
              display: false,
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
