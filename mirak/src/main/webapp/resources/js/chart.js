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

      const ctx1 = document.getElementById("myChart1").getContext("2d");
      const byMenuChartData = {
        labels: pro_name,
        datasets: [
          {
            label: "메뉴 별 판매현황",
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
      const myChart1 = new Chart(ctx1, {
        type: "bar",
        data: byMenuChartData,
        options: {
          maintainAspectRatio: false,
          responsive: false,
          scales: {
            y: {
              beginAtZero: true,
            },
          },
          title: {
            display: true,
            text: "메뉴별 별 판매현황",
          },
        },
      });

      let isByMenuChart = true;

      ctx1.canvas.addEventListener("click", function (e) {
        console.log("click이벤트 실행!!!!!");
        const activePoints = myChart1.getElementsAtEventForMode(
          e,
          "nearest",
          { intersect: true },
          true
        );
        if (activePoints.length > 0) {
          const clickedIndex = activePoints[0].index;
          const clickedMenu = pro_name[clickedIndex];

          $.ajax({
            type: "GET",
            url: "/admin/charts/getTotalByMenuList/" + clickedMenu,
            data: {
              clickedMenu: clickedMenu,
            },
            success: function (data) {
              console.log("data반환 success~~~");
              const totalPrice = data.totalPrice;
              const pay_date = data.pay_date;
              const chartData = {
                labels: pay_date,
                datasets: [
                  {
                    label: `${clickedMenu} 판매현황`,
                    data: totalPrice,
                    backgroundColor: "rgba(255, 99, 71, 0.2)",
                    borderColor: "rgb(255, 99, 71)",
                  },
                ],
              };
              if (isByMenuChart) {
                myChart1.data = chartData;
                myChart1.options.title.text = `${clickedMenu} 판매현황`;
                isByMenuChart = false;
              } else {
                myChart1.data = byMenuChartData;
                myChart1.options.title.text = "메뉴 별 판매현황";
                isByMenuChart = true;
              }

              myChart1.update();
              console.log("myChart1 수정");
            },
            error: function (xhr, status, error) {
              console.error(error);
            },
          });
        } else {
          if (!isByMenuChart) {
            myChart1.data = byMenuChartData;
            myChart1.options.title.text = "메뉴 별 판매현황";
            isByMenuChart = true;
            myChart1.update();
            console.log("myChart11 수정");
          }
        }
      });

      const ctx2 = document.getElementById("myChart2").getContext("2d");
      const byMonthChartData = {
        labels: pay_month,
        datasets: [
          {
            label: "월 별 판매현황",
            data: ByMonthTotalPrice,
            tension: 0.2,
            fill: false,
            borderColor: "rgb(102, 102, 102)",
            borderWidth: 2,
            borderCapStyle: "round",
            borderJoinStyle: "miter",
          },
        ],
      };

      const myChart2 = new Chart(ctx2, {
        type: "line",
        data: byMonthChartData,
        options: {
          maintainAspectRatio: false,
          responsive: false,
          scales: {
            y: {
              beginAtZero: true,
            },
          },
          title: {
            display: true,
            text: "월 별 판매현황",
          },
        },
      });

      let isByMonthChart = true;

      ctx2.canvas.addEventListener("click", function (e) {
        console.log("click이벤트 실행!!!!!");
        const activePoints = myChart2.getElementsAtEventForMode(
          e,
          "nearest",
          { intersect: true },
          true
        );
        if (activePoints.length > 0) {
          const clickedIndex = activePoints[0].index;
          const clickedDate = pay_month[clickedIndex];
          const clickedMonth = clickedDate.substr(5, 7);

          $.ajax({
            type: "GET",
            url: "/admin/charts/getTotalByDayList/" + clickedMonth,
            data: {
              clickedMonth: clickedMonth,
            },
            success: function (data) {
              console.log("data반환 success~~~");
              const totalPrice = data.totalPrice;
              const pay_day = data.pay_day;
              const chartData = {
                labels: pay_day,
                datasets: [
                  {
                    label: `${clickedMonth.substr(1, 2)}월 판매현황`,
                    data: totalPrice,
                    tension: 0.1,
                    fill: false,
                    borderColor: "rgb(102, 102, 102)",
                    borderWidth: 2,
                    borderCapStyle: "round",
                    borderJoinStyle: "miter",
                  },
                ],
              };
              if (isByMonthChart) {
                myChart2.data = chartData;
                myChart2.options.title.text = `${clickedMonth.substr(
                  1,
                  2
                )}월 판매현황`;
                isByMonthChart = false;
              } else {
                myChart2.data = byMonthChartData;
                myChart2.options.title.text = "월 별 판매현황";
                isByMonthChart = true;
              }

              myChart2.update();
              console.log("myChart2 수정");
            },
            error: function (xhr, status, error) {
              console.error(error);
            },
          });
        } else {
          if (!isByMonthChart) {
            myChart2.data = byMonthChartData;
            myChart2.options.title.text = "월 별 판매현황";
            isByMonthChart = true;
            myChart2.update();
            console.log("myChart2 수정");
          }
        }
      });

      const ctx3 = document.getElementById("myChart3").getContext("2d");
      const salesRate = {
        labels: pro_name,
        datasets: [
          {
            label: "판매비율",
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
            hoverOffset: 4,
          },
        ],
      };

      const myChart3 = new Chart(ctx3, {
        type: "doughnut",
        data: byMonthChartData,
        options: {
          maintainAspectRatio: false,
          responsive: false,
          scales: {
            y: {
              beginAtZero: true,
            },
          },
          title: {
            display: true,
            text: "판매비율",
          },
        },
      });
    },
  });
});
