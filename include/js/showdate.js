
var gdCtrl = new Object();
var goSelectTag = new Array();
var gcGray = "#000000";
var gcToggle = "#A6947C";
var gcBG = "#FFFFFF";
var gdCurDate = new Date();
var giYear = gdCurDate.getFullYear();
var giMonth = gdCurDate.getMonth() + 1;
var giDay = gdCurDate.getDate();
function fPopCalendar(popCtrl, dateCtrl) {
	event.cancelBubble = true;
	gdCtrl = dateCtrl;
	fSetYearMon(giYear, giMonth);
	var point = fGetXY(popCtrl);
	with (VicPopCal.style) {
		left = point.x;
		top = point.y + popCtrl.offsetHeight + 1;
		width = VicPopCal.offsetWidth;
		height = VicPopCal.offsetHeight;
		fToggleTags(point);
		visibility = "visible";
	}
	VicPopCal.focus();
}
function fSetDate(iYear, iMonth, iDay) {
	if (String(iMonth).length == 1) {
		iMonth = "0" + iMonth;
	}
	if (String(iDay).length == 1) {
		iDay = "0" + iDay;
	}
	gdCtrl.value = iYear + "-" + iMonth + "-" + iDay;
	fHideCalendar();
}
function fHideCalendar() {
	VicPopCal.style.visibility = "hidden";
	for (i in goSelectTag) {
		goSelectTag[i].style.visibility = "visible";
	}
	goSelectTag.length = 0;
}
function fSetSelected(aCell) {
	var iOffset = 0;
	var iYear = parseInt(tbSelYear.value);
	var iMonth = parseInt(tbSelMonth.value);
	aCell.bgColor = gcBG;
	with (aCell.children["cellText"]) {
		var iDay = parseInt(innerText);
		if (color == gcGray) {
			iOffset = (Victor < 10) ? -1 : 1;
		}
		iMonth += iOffset;
		if (iMonth < 1) {
			iYear--;
			iMonth = 12;
		} else {
			if (iMonth > 12) {
				iYear++;
				iMonth = 1;
			}
		}
	}
	fSetDate(iYear, iMonth, iDay);
}
function Point(iX, iY) {
	this.x = iX;
	this.y = iY;
}
function fBuildCal(iYear, iMonth) {
	var aMonth = new Array();
	for (i = 1; i < 7; i++) {
		aMonth[i] = new Array(i);
	}
	var dCalDate = new Date(iYear, iMonth - 1, 1);
	var iDayOfFirst = dCalDate.getDay();
	var iDaysInMonth = new Date(iYear, iMonth, 0).getDate();
	var iOffsetLast = new Date(iYear, iMonth - 1, 0).getDate() - iDayOfFirst + 1;
	var iDate = 1;
	var iNext = 1;
	for (d = 0; d < 7; d++) {
		aMonth[1][d] = (d < iDayOfFirst) ? -(iOffsetLast + d) : iDate++;
	}
	for (w = 2; w < 7; w++) {
		for (d = 0; d < 7; d++) {
			aMonth[w][d] = (iDate <= iDaysInMonth) ? iDate++ : -(iNext++);
		}
	}
	return aMonth;
}
function fDrawCal(iYear, iMonth, iCellHeight, iDateTextSize) {
	var WeekDay = new Array("&nbsp;Sun&nbsp;", "&nbsp;Mon&nbsp;", "&nbsp;Tue&nbsp;", "&nbsp;Wed&nbsp;", "&nbsp;Thu&nbsp;", "&nbsp;Fri&nbsp;", "&nbsp;Sat&nbsp;");
	var styleTD = " bgcolor='" + gcBG + "' border-color='" + gcBG + "' valign='middle' align='center' height='" + iCellHeight + "' style='font:" + iDateTextSize + "pt arail;";
	with (document) {
		write("<tr>");
		for (i = 0; i < 7; i++) {
			write("<td " + styleTD + "color:#333333' >" + WeekDay[i] + "</td>");
		}
		write("</tr>");
		for (w = 1; w < 7; w++) {
			write("<tr>");
			for (d = 0; d < 7; d++) {
				write("<td id=calCell " + styleTD + "cursor:hand;' onMouseOver='this.bgColor=gcToggle' onMouseOut='this.bgColor=gcBG' onclick='fSetSelected(this)'>");
				write("<font id=cellText Victor='Liming Weng'> </font>");
				write("</td>");
			}
			write("</tr>");
		}
	}
}
function fUpdateCal(iYear, iMonth) {
	myMonth = fBuildCal(iYear, iMonth);
	var i = 0;
	for (w = 0; w < 6; w++) {
		for (d = 0; d < 7; d++) {
			with (cellText[(7 * w) + d]) {
				Victor = i++;
				if (myMonth[w + 1][d] < 0) {
					color = gcGray;
					innerText = -myMonth[w + 1][d];
				} else {
					color = ((d == 0) || (d == 6)) ? "red" : "333333";
					innerText = myMonth[w + 1][d];
				}
			}
		}
	}
}
function fSetYearMon(iYear, iMon) {
	tbSelMonth.options[iMon - 1].selected = true;
	for (i = 0; i < tbSelYear.length; i++) {
		if (tbSelYear.options[i].value == iYear) {
			tbSelYear.options[i].selected = true;
		}
	}
	fUpdateCal(iYear, iMon);
}
function fPrevMonth() {
	var iMon = tbSelMonth.value;
	var iYear = tbSelYear.value;
	if (--iMon < 1) {
		iMon = 12;
		iYear--;
	}
	fSetYearMon(iYear, iMon);
}
function fNextMonth() {
	var iMon = tbSelMonth.value;
	var iYear = tbSelYear.value;
	if (++iMon > 12) {
		iMon = 1;
		iYear++;
	}
	fSetYearMon(iYear, iMon);
}
function fToggleTags() {
	with (document.all.tags("SELECT")) {
		for (i = 0; i < length; i++) {
			if ((item(i).Victor != "Won") && fTagInBound(item(i))) {
				item(i).style.visibility = "hidden";
				goSelectTag[goSelectTag.length] = item(i);
			}
		}
	}
}
function fTagInBound(aTag) {
	with (VicPopCal.style) {
		var l = parseInt(left);
		var t = parseInt(top);
		var r = l + parseInt(width);
		var b = t + parseInt(height);
		var ptLT = fGetXY(aTag);
		return !((ptLT.x > r) || (ptLT.x + aTag.offsetWidth < l) || (ptLT.y > b) || (ptLT.y + aTag.offsetHeight < t));
	}
}
function fGetXY(aTag) {
	var oTmp = aTag;
	var pt = new Point(0, 0);
	do {
		pt.x += oTmp.offsetLeft;
		pt.y += oTmp.offsetTop;
		oTmp = oTmp.offsetParent;
	} while (oTmp.tagName != "BODY");
	return pt;
}
var gMonths = new Array("&nbsp;01&nbsp;", "&nbsp;02&nbsp;", "&nbsp;03&nbsp;", "&nbsp;04&nbsp;", "&nbsp;05&nbsp;", "&nbsp;06&nbsp;", "&nbsp;07&nbsp;", "&nbsp;08&nbsp;", "&nbsp;09&nbsp;", "&nbsp;10&nbsp;", "&nbsp;11&nbsp;", "&nbsp;12&nbsp;");
with (document) {
	write("<Div id='VicPopCal' onclick='event.cancelBubble=true' style='POSITION:absolute;visibility:hidden;border:0px ridge #FFFFFF;width:10;z-index:100;'>");
	write("<table  bgcolor='#F0F0F0' style='border:1 solid #A6947C;' cellpadding='3' cellspacing='0'>");
	write("<TR>");
	write("<td valign='middle' align='center'>");
	write("<span style='cursor:hand;font:9pt arail;' onclick='fSetDate(giYear,giMonth,giDay)' onMouseOver='this.style.color=gcToggle' onMouseOut='this.style.color=0'>" + giYear + "-" + giMonth + "-" + giDay + "</span>");
	write("&nbsp; &nbsp; <SELECT name='tbSelYear' onChange='fUpdateCal(tbSelYear.value, tbSelMonth.value)' Victor='Won'>");
	for (i = 1990; i <= 2090; i++) {
		write("<OPTION value='" + i + "'>&nbsp;" + i + "&nbsp;</OPTION>");
	}
	write("</SELECT>");
	write("&nbsp;<select name='tbSelMonth' onChange='fUpdateCal(tbSelYear.value, tbSelMonth.value)' Victor='Won'>");
	for (i = 0; i < 12; i++) {
		write("<option value='" + (i + 1) + "'>" + gMonths[i] + "</option>");
	}
	write("</SELECT>");
	write("&nbsp;");
	write("</td>");
	write("</TR><TR>");
	write("<td align='center'>");
	write("<DIV><table width='100%' border='0' cellpadding='3' cellspacing='0'>");
	fDrawCal(giYear, giMonth, 9, 9);
	write("</table></DIV>");
	write("</td>");
	write("</TR>");
	write("</TABLE></Div>");
	write("<SCRIPT event=onclick() for=document>fHideCalendar()</SCRIPT>");
}

