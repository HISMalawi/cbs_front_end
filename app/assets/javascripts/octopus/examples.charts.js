
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
		labels: ['Series A', 'Series B'],
		barColors: ['#0088cc', '#2baab1'],
		fillOpacity: 0.7,
		smooth: false,
		stacked: true,
		hideHover: true
	});

    /*
    Morris: Stacked
    */
    Morris.Bar({
        resize: true,
        element: 'morrisStacked2',
        data: morrisStackedData,
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        barColors: ['#0088cc', '#2baab1'],
        fillOpacity: 0.7,
        smooth: false,
        stacked: true,
        hideHover: true
    });

}).apply( this, [ jQuery ]);
