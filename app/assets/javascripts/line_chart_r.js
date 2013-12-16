new Morris.Line({
  // ID of the element in which to draw the chart.
  element: 'smallLineChart',
  // Chart data records -- each entry in this array corresponds to a point on
  // the chart.
  data: [
    { "wk commencing": '07 Oct 13', "% wins": 46 },
    { "wk commencing": '14 Oct 13', "% wins": 45 },
    { "wk commencing": '21 Oct 13', "% wins": 49 },
    { "wk commencing": '28 Oct 13', "% wins": 50 },
    { "wk commencing": '04 Nov 13', "% wins": 47 },
    { "wk commencing": '11 Nov 13', "% wins": 46 },
    { "wk commencing": '18 Nov 13', "% wins": 50 },
    { "wk commencing": '25 Nov 13', "% wins": 67 },
  ],
  // The name of the data record attribute that contains x-"% wins"s.
  xkey: 'wk commencing',
  // A list of names of data record attributes that contain y-"% wins"s.
  ykeys: ['% wins'],
  // Labels for the ykeys -- will be displayed when you hover over the
  // chart.
  labels: [''],

  lineColors: ["black"],

  postUnits: ["%"], 

  axes: false,

  xlabels: ["weeks"],

  xLabelFormat: function (x) { return x.toString();},

  grid: false,

  pointSize: ["2"],

  hideHover: ["auto"],

  lineWidth: ["2"]

});