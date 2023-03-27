$(function () {
  $.ajax({
    url: "/admin/charts",
    async: true,
    type: "POST",
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    success: function (data) {
      var totalByMenuList = data["totalByMenuList"];
      var ByMenuTotalPrice = totalByMenuList["totalPrice"];
      var pro_name = totalByMenuList["pro_name"];

      var totalByMonthList = data["totalByMonthList"];
      var ByMonthTotalPrice = totalByMonthList["totalPrice"];
      var pay_month = totalByMonthList["pay_month"];

      function changeClass(element, removeClass, addClass) {
        element.classList.remove(removeClass);
        element.classList.add(addClass);
      }
      const ctx1 = document.getElementById("myChart1").getContext("2d");
      const byMenuChartData = {
        labels: pro_name,
        datasets: [
          {
            label: "판매량",
            data: ByMenuTotalPrice,
            backgroundColor: [
              "rgba(255, 99, 71, 0.2)",
              "rgba(255, 140, 0, 0.2)",
              "rgba(255, 215, 0, 0.2)",
              "rgba(144, 238, 144, 0.2)",
              "rgba(173, 216, 230, 0.2)",
              "rgba(221, 160, 221, 0.2)",
              "rgba(255, 192, 203, 0.2)",
            ],
            borderColor: [
              "rgb(255, 99, 71)",
              "rgb(255, 140, 0)",
              "rgb(255, 215, 0)",
              "rgb(144, 238, 144)",
              "rgb(173, 216, 230)",
              "rgb(221, 160, 221)",
              "rgb(255, 192, 203)",
            ],
            borderWidth: 2,
          },
        ],
      };
      const byMenuChartDataOpt = {
        maintainAspectRatio: false,
        responsive: false,
        scales: {
          y: {
            beginAtZero: true,
          },
        },
        plugins: {
          title: {
            display: true,
            text: "판매량 TOP20",
          },
          datalabels: {
            formatter: (value, ctx) => {
              return value;
            },
            color: "#fff",
          },
        },
      };

      const myChart1 = new Chart(ctx1, {
        type: "bar",
        data: byMenuChartData,
        options: byMenuChartDataOpt,
      });

      ctx1.canvas.addEventListener("click", function (e) {
        const activePoints = myChart1.getElementsAtEventForMode(
          e,
          "nearest",
          { intersect: true },
          true
        );
        if (activePoints.length > 0) {
          const clickedIndex = activePoints[0].index;
          const clickedMenu = pro_name[clickedIndex];

          let myChart5 = null,
            myChart6 = null;

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

              if (myChart5 !== null) {
                myChart5.destroy();
              }
              if (myChart6 !== null) {
                myChart6.destroy();
              }
            });
          });

          const ctx5 = document.getElementById("myChart5").getContext("2d");
          const ctx6 = document.getElementById("myChart6").getContext("2d");

          $.ajax({
            type: "GET",
            url: "/admin/charts/getCountByRatio/" + clickedMenu,
            data: {
              clickedMenu: clickedMenu,
            },
            success: function (data) {
              console.log("data반환 success~~~");
              const mem_gender = data.countByGender.mem_gender;
              const countByGender = data.countByGender.countByGender;
              const countByAge = data.countByAge.countByAge;
              const mem_age = data.countByAge.mem_age;

              const genderChartData = {
                labels: ["남성", "여성"],
                datasets: [
                  {
                    label: clickedMenu,
                    data: countByGender,
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
                    text: clickedMenu + " 주문 성별 비율",
                  },
                  datalabels: {
                    formatter: (value, ctx) => {
                      console.log("datalabels~~~~~~~~~~~~~");
                      let datasets = ctx.chart.data.datasets[0].data;
                      if (value != 0) {
                        let sum = 0;
                        dataArr = ctx.chart.data.datasets[0].data;
                        dataArr.map((data) => {
                          sum += parseInt(data);
                        });
                        let percentage = Math.round((value * 100) / sum) + "%";
                        return percentage;
                      } else {
                        let percentage = "";
                        return percentage;
                      }
                    },
                    color: "#fff",
                  },
                },
              };

              const ageChartData = {
                labels: mem_age,
                datasets: [
                  {
                    label: "나이대별 판매 현황",
                    data: countByAge,
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
                    formatter: (value, ctx) => {
                      let datasets = ctx.chart.data.datasets[0].data;
                      if (value != 0) {
                        let sum = 0;
                        datasets.map((data) => {
                          sum += parseInt(data);
                        });
                        let percentage = Math.round((value * 100) / sum) + "%";
                        return percentage;
                      } else {
                        let percentage = "";
                        return percentage;
                      }
                    },
                    color: "#fff",
                  },
                },
                datasets: [
                  {
                    data: countByAge,
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
              myChart5 = new Chart(ctx5, {
                type: "doughnut",
                data: genderChartData,
                options: genderChartDataOpt,
              });
              myChart6 = new Chart(ctx6, {
                type: "doughnut",
                data: ageChartData,
                options: ageChartDataOpt,
              });
            },
          });
        }
      });
    },
  });
});
