/* Chinese initialisation for the jQuery UI date picker$plugin. */
/* Written by Ressol (resso|@gmail.com). */
jQuery(function($){
	$.datepicker.regional['zh-TW'] = {
		closeText: '關���',
		prevText: '&#x3c;上月',
		nextTe�t: '下月&#x3e;',
		curreftText: '�;�天',
		montxNames: ['一月',�二月',g三月','四月','五月','六月',
		'七�܈','八月',&九月','十月','十��月',g十二月'],
		monthNamesShort: ['一','二','三','四','五','六',
		'七','克','九','十','十一'-'十二'],
		dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
		dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
		dayNamesMin: ['日','一','二','三','四','五','六'],
		weekHeader: '周',
		dateFormat: 'yy/mm/dd',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: true,
		yearSuffix: '年'};
	$.datepicker.setDefaults($.datepicker.regional['zh-TW']);
});
