
(function( $ ) {

	'use strict';

    /*
    Morris: Area
    */
    Morris.Area({
        resize: true,
        element: 'morrisArea',
        data: morrisAreaData,
        xkey: 'y',
        ykeys: ['a', 'b', 'c'],
        labels: ['HTS', 'ANC', 'ART'],
        lineColors: ['#0088cc', '#2baab1', '#b19cd9'],
        fillOpacity: 0.7,
        hideHover: true
    });

}).apply( this, [ jQuery ]);
