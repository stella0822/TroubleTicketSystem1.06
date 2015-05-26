document.writeln('<style>.btnDateWrap{font:12px/1.5 arial;}.btnDateWrap input{cursor:pointer;}</style>');
document.writeln('<div id=meizzDateLayer style="position: absolute; width: 142; height: 166; z-index: 9998; display: none">');
document.writeln('<span id=tmpSelectYearLayer  style="z-index: 9999;position: absolute;top: 2; left: 18;display: none"></span>');
document.writeln('<span id=tmpSelectMonthLayer style="z-index: 9999;position: absolute;top: 2; left: 75;display: none"></span>');
document.writeln('<table border=0 cellspacing=1 cellpadding=0 width=142 height=160 bgcolor=#000000 onselectstart="return false">');
document.writeln('  <tr><td width=142 height=23 bgcolor=#FFFFFF><table border=0 cellspacing=1 cellpadding=0 width=140 height=23>');
document.writeln('      <tr align=center><td width=20 align=center bgcolor=#808080 style="font-size:12px;cursor: pointer;color: #FFD700" ');
document.writeln('        onclick="meizzPrevM()" title="前一月" ><b >&lt;</b>');
document.writeln('        </td><td width=100 align=center style="font-size:12px;cursor:default" >');

document.writeln('        <span  id=meizzYearHead onmouseover="style.backgroundColor=\'yellow\'" onmouseout="style.backgroundColor=\'white\'" title="点击这里选择年份" onclick="tmpSelectYearInnerHTML(this)" style="cursor: pointer;"></span>&nbsp;年&nbsp;<span');
document.writeln('         id=meizzMonthHead  onmouseover="style.backgroundColor=\'yellow\'" onmouseout="style.backgroundColor=\'white\'" title="点击这里选择月份" onclick="tmpSelectMonthInnerHTML(this)" style="cursor: pointer;"></span>&nbsp;月</td>');

document.writeln('        <td width=20 bgcolor=#808080 align=center style="font-size:12px;cursor: pointer;color: #FFD700" ');
document.writeln('         onclick="meizzNextM()" title="后一月" ><b >&gt;</b></td></tr>');
document.writeln('    </table></td></tr>');
document.writeln('  <tr><td width=142 height=18 style=background:#808080>');
document.writeln('<table border=0 cellspacing=0 cellpadding=0 width=140 height=1 style="cursor:default">');
document.writeln('<tr align=center><td style="font-size:12px; " >日</td>');
document.writeln('<td style="font-size:12px;"   class="td1">一</td><td style="font-size:12px;"  >二</td>');
document.writeln('<td style="font-size:12px;"  >三</td><td style="font-size:12px;"  >四</td>');
document.writeln('<td style="font-size:12px;"  >五</td><td style="font-size:12px;"  >六</td></tr>');
document.writeln('</table></td></tr>');
document.writeln('  <tr><td width=142 height=120>');
document.writeln('    <table border=0 cellspacing=1 cellpadding=0 width=140 height=120 bgcolor=#FFFFFF>');
var n=0; for (j=0;j<5;j++){ document.writeln (' <tr align=center>'); for (i=0;i<7;i++){
document.writeln('<td width=20 height=20 id=meizzDay'+n+'   onclick=meizzDayClick(this)  style="cursor:pointer"></td>');n++;}
document.writeln('</tr>');}
document.writeln('      <tr align=center><td width=20 height=20  id=meizzDay35  style="cursor:pointer"');
document.writeln('         onclick=meizzDayClick(this)></td>');
document.writeln('        <td width=20 height=20 style="font-size:12px" id=meizzDay36  onclick=meizzDayClick(this)></td>');
document.writeln('        <td colspan=5 align=right ><span onclick=clearLayer() style="font-size:12px;cursor: pointer"');
document.writeln('          title="清空日期"><u style=color:#f30>清空</u></span>&nbsp;&nbsp;&nbsp;<span onclick=closeLayer() style="font-size:12px;cursor: pointer"');
document.writeln('          title="返回（不选择日期）"><u style=color:#f30>关闭</u></span>&nbsp;</td></tr>');
document.writeln('    </table></td></tr><tr><td>');
document.writeln('        <table border=0 cellspacing=1 cellpadding=0 width=100% class="btnDateWrap">');
document.writeln('          <tr><td  align=left "><input  type=button value="<<" style="width:25px;" title="前一年" onclick="meizzPrevY()" ');
document.writeln('             onfocus="this.blur()" ><input  title="前一月" type=button   style="width:25px;" ');
document.writeln('             value="<" onclick="meizzPrevM()" onfocus="this.blur()"></td><td ');
document.writeln('              align=right><input  type=button value=">" onclick="meizzNextM()"  ');
document.writeln('             onfocus="this.blur()" title="后一月" style="width:25px;"><input style="width:25px;"');
document.writeln('              type=button value=">>" title="后一年"  onclick="meizzNextY()"');
document.writeln('             onfocus="this.blur()" ></td>');
document.writeln('</tr></table></td></tr></table></div>');

var $$ = function(id){
	return "string" == typeof id ? document.getElementById(id) : id; 
};
var fixEvent = function(e){
	return e || window.event;
}
var fixEventTarget = function(e){
	var evt = fixEvent(e);
	if(window.event){
		var current = evt.srcElement;
	}else{
		var current = evt.target;
	}
	return current;
};
function isIE()
{ //ie?

	if (window.navigator.userAgent.toLowerCase().indexOf("msie") >= 1)
		return true;
	else
		return false;
}

if (!isIE())
{ //firefox innerText define

	HTMLElement.prototype.__defineGetter__("innerText",
	function ()
	{
		var anyString = "";
		var childS = this.childNodes;
		for (var i = 0; i < childS.length; i++)
		{
			if (childS[i].nodeType == 1)
				anyString += childS[i].tagName == "BR"
				 ? "\r\n" : childS[i].textContent;
			else if (childS[i].nodeType == 3)
				anyString += childS[i].nodeValue;
		}
		return anyString;
	});
	HTMLElement.prototype.__defineSetter__("innerText",
	function (sText)
	{
		this.textContent = sText;
	});
}
var outObject;
var outTimetype=0;
function setday(tt,timetype) //主调函数
{
  //if (arguments.length >  3){alert("对不起！传入本控件的参数太多！");return;}
  if (arguments.length == 0){alert("对不起！您没有传回本控件任何参数！");return;}
  var dads  = $$('meizzDateLayer').style;
  var th = tt;
  var ttop  = tt.offsetTop;     //TT控件的定位点高
  var thei  = tt.clientHeight;  //TT控件本身的高
  var tleft = tt.offsetLeft;    //TT控件的定位点宽
  var ttyp  = tt.type;          //TT控件的类型
  while (tt = tt.offsetParent){ttop+=tt.offsetTop; tleft+=tt.offsetLeft;}
  dads.top  = (ttyp=="image")? ttop+thei : ttop+thei+6;
  dads.left = tleft;
  //outObject = (arguments.length == 1) ? th : obj;
  outObject=th;
  if(arguments.length == 2){outTimetype=timetype}
  dads.display = '';
  //event.returnValue=false;
}

var MonHead = new Array(12);    		   //定义阳历中每个月的最大天数
    MonHead[0] = 31; MonHead[1] = 28; MonHead[2] = 31; MonHead[3] = 30; MonHead[4]  = 31; MonHead[5]  = 30;
    MonHead[6] = 31; MonHead[7] = 31; MonHead[8] = 30; MonHead[9] = 31; MonHead[10] = 30; MonHead[11] = 31;

var meizzTheYear=new Date().getFullYear(); //定义年的变量的初始值
var meizzTheMonth=new Date().getMonth()+1; //定义月的变量的初始值
var meizzWDay=new Array(37);               //定义写日期的数组

document.onclick = function(e) //任意点击时关闭该控件
{ 
	var target = fixEventTarget(e);
	with(target)
	{
		/*if (tagName != "INPUT" && getAttribute("Author")==null)
		$$('meizzDateLayer').style.display="none";*/
	}
}

function meizzWriteHead(yy,mm)  //往 head 中写入当前的年与月
  {
	$$('meizzYearHead').innerText  = yy;
    $$('meizzMonthHead').innerText = mm;
  }

function tmpSelectYearInnerHTML(strYear) //年份的下拉框
{ var strYear = strYear.innerText;
  if (strYear.match(/\D/)!=null){alert("年份输入参数不是数字！");return;}
  var m = (strYear) ? strYear : new Date().getFullYear();
  if (m < 1000 || m > 9999) {alert("年份值不在 1000 到 9999 之间！");return;}
  var n = m - 10;
  if (n < 1000) n = 1000;
  if (n + 26 > 9999) n = 9974;
  var s = "<select  name=tmpSelectYear style='font-size: 12px' "
     s += "onblur='document.all.tmpSelectYearLayer.style.display=\"none\"' "
     s += "onchange='document.all.tmpSelectYearLayer.style.display=\"none\";"
     s += "meizzTheYear = this.value; meizzSetDay(meizzTheYear,meizzTheMonth)'>\r\n";
  var selectInnerHTML = s;
  for (var i = n; i < n + 26; i++)
  {
    if (i == m)
       {selectInnerHTML += "<option value='" + i + "' selected>" + i + "年" + "</option>\r\n";}
    else {selectInnerHTML += "<option value='" + i + "'>" + i + "年" + "</option>\r\n";}
  }
  selectInnerHTML += "</select>";
	$$('tmpSelectYearLayer').style.display="";
	$$('tmpSelectYearLayer').innerHTML = selectInnerHTML;
	//$$('tmpSelectYear').focus();
}

function tmpSelectMonthInnerHTML(strMonth) //月份的下拉框
{ var strMonth = strMonth.innerText;
  if (strMonth.match(/\D/)!=null){alert("月份输入参数不是数字！");return;}
  var m = (strMonth) ? strMonth : new Date().getMonth() + 1;
  var s = "<select  name=tmpSelectMonth style='font-size: 12px' "
     s += "onblur='document.all.tmpSelectMonthLayer.style.display=\"none\"' "
     s += "onchange='document.all.tmpSelectMonthLayer.style.display=\"none\";"
     s += "meizzTheMonth = this.value; meizzSetDay(meizzTheYear,meizzTheMonth)'>\r\n";
  var selectInnerHTML = s;
  for (var i = 1; i < 13; i++)
  {
    if (i == m)
       {selectInnerHTML += "<option value='"+i+"' selected>"+i+"月"+"</option>\r\n";}
    else {selectInnerHTML += "<option value='"+i+"'>"+i+"月"+"</option>\r\n";}
  }
  selectInnerHTML += "</select>";
	$$('tmpSelectMonthLayer').style.display="";
	$$('tmpSelectMonthLayer').innerHTML = selectInnerHTML;
	//$$('tmpSelectMonth').focus();
}

function closeLayer()               //这个层的关闭
  {
   $$('meizzDateLayer').style.display="none";
  }

function clearLayer()
{
	outObject.value="";
}

document.onkeydown = function(e)
  { var eve = fixEvent(e);
    if (eve.keyCode==27)$$('meizzDateLayer').style.display="none";
  }

function IsPinYear(year)            //判断是否闰平年
  {
    if (0==year%4&&((year%100!=0)||(year%400==0))) return true;else return false;
  }

function GetMonthCount(year,month)  //闰年二月为29天
  {
    var c=MonHead[month-1];if((month==2)&&IsPinYear(year)) c++;return c;
  }

function GetDOW(day,month,year)     //求某天的星期几
  {
    var dt=new Date(year,month-1,day).getDay()/7; return dt;
  }

function meizzPrevY()  //往前翻 Year
  {
    if(meizzTheYear > 999 && meizzTheYear <10000){meizzTheYear--;}
    else{alert("年份超出范围（1000-9999）！");}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzNextY()  //往后翻 Year
  {
    if(meizzTheYear > 999 && meizzTheYear <10000){meizzTheYear++;}
    else{alert("年份超出范围（1000-9999）！");}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzToday()  //Today Button
  {
    meizzTheYear = "";
    meizzTheMonth = "";
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzPrevM()  //往前翻月份
  {
    if(meizzTheMonth>1){meizzTheMonth--}else{meizzTheYear--;meizzTheMonth=12;}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzNextM()  //往后翻月份
  {
    if(meizzTheMonth==12){meizzTheYear++;meizzTheMonth=1}else{meizzTheMonth++}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }

function meizzSetDay(yy,mm)   //主要的写程序**********
{
  meizzWriteHead(yy,mm);
  for (var i = 0; i < 37; i++){meizzWDay[i]=""};  //将显示框的内容全部清空
  var day1 = 1,firstday = new Date(yy,mm-1,1).getDay();  //某月第一天的星期几
  for (var i = firstday; day1 < GetMonthCount(yy,mm)+1; i++){meizzWDay[i]=day1;day1++;}
  for (var i = 0; i < 37; i++)
  { var da = $$("meizzDay"+i)     //书写新的一个月的日期星期排列
    if (meizzWDay[i]!="")
      { da.innerHTML = "<b>" + meizzWDay[i] + "</b>";
        da.style.backgroundColor = (yy == new Date().getFullYear() &&
        mm == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate()) ? "#FFD700" : "#73a6de";
        da.style.cursor="hand"
      }
    else{da.innerHTML="";da.style.backgroundColor="";da.style.cursor="default"}
  }
}
function meizzDayClick(n)  //点击显示框选取日期，主输入函数*************
{ var n = n.innerText;
  var yy = meizzTheYear;
  var mm = meizzTheMonth;
  if (mm < 10){mm = "0" + mm;}
  if (outObject)
  {
    if (!n) {outObject.value=""; return;}
    if ( n < 10){n = "0" + n;}
	var time=new Date();
	mi=time.getMinutes();
	ms=time.getSeconds();
	mh=time.getHours();
	if(mi<10)mi='0'+mi;
	if(ms<10)ms='0'+ms;
	if(mh<10)mh='0'+mh;
	
	//注：在这里你可以输出改成你想要的格式

	if (outTimetype==1)
	{
		outObject.value= yy + "-" + mm + "-" + n; 
	}
    else{
		outObject.value= yy + "-" + mm + "-" + n + " " + mh + ":" + mi + ":" + ms; 
	}
	
    closeLayer(); 
  }
  else {closeLayer(); alert("您所要输出的控件对象并不存在！");}
}
meizzSetDay(meizzTheYear,meizzTheMonth);