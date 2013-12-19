$(document).ready(function(){
  if($('#smallLineChart').length) {
    new Morris.Line({
      // ID of the element in which to draw the chart.
      element: 'smallLineChart',
      // Chart data records -- each entry in this array corresponds to a point on
      // the chart.
      data: [
        { "wk commencing": '2013-10-07', "% wins": 46 },
        { "wk commencing": '2013-10-14', "% wins": 45 },
        { "wk commencing": '2013-10-21', "% wins": 49 },
        { "wk commencing": '2013-10-28', "% wins": 50 },
        { "wk commencing": '2013-11-04', "% wins": 47 },
        { "wk commencing": '2013-11-11', "% wins": 46 },
        { "wk commencing": '2013-11-18', "% wins": 50 },
        { "wk commencing": '2013-11-25', "% wins": 52 }
      ],
      // The name of the data record attribute that contains x-"% wins"s.
      xkey: 'wk commencing',
      // A list of names of data record attributes that contain y-"% wins"s.
      ykeys: ['% wins'],
      // Labels for the ykeys -- will be displayed when you hover over the
      // chart.
      labels: [''],

      lineColors: ["#424242"],

      postUnits: ["%"], 

      axes: false,

      xlabels: ["weeks"],

      xLabelFormat: function (x) { return x.toString();},

      // hoverCallback: function(index, options, content) {
      //   wins = options.data[index]['% wins'];
      //   return (wins + '%');
      // },

      grid: false,

      //pointSize: ["4"],

      // hideHover: ["auto"],

      lineWidth: ["2"]

    });
  }
})