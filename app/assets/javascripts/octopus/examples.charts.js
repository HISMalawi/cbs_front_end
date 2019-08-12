
(function( $ ) {

	'use strict';

	/*
	Morris: Stacked
	*/
	Morris.Bar({
		resize: true,
		element: 'morrisStacked',
		data: morrisStackedData,
		xkey: 'y',
		ykeys: ['a', 'b'],
		labels: ['w/t Init', 'w/tout Init'],
		barColors: ['#0088cc', '#2baab1'],
		fillOpacity: 0.7,
		smooth: false,
		stacked: true,
		hideHover: true
	});

    /*
    Morris: Stacked2
    */
    Morris.Bar({
        resize: true,
        element: 'morrisStacked2',
        data: morrisStackedData2,
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['w/t Init', 'w/tout Init'],
        barColors: ['#0088cc', '#2baab1'],
        fillOpacity: 0.7,
        smooth: false,
        stacked: true,
        hideHover: true
    });

}).apply( this, [ jQuery ]);
