function jsp_selecttab(pdiv){
    var sclassbefore=pdiv.className.substring(0,pdiv.className.indexOf('_')); 
    var itab=0;
    var btab=false;
    var i=0;
    var pset=document.getElementsByName(pdiv.id);
    for(var i=0;i<pset.length;i++){
        if(pset[i].id==pdiv.id){
            if(!btab){itab++;}
            if(pset[i]==pdiv){
                pset[i].className=sclassbefore+'_sel';
                btab=true;
            }
            else{
                pset[i].className=sclassbefore+'_nor';
            }
        }
    }
    var itemp=0;
    var pset=document.getElementsByName(pdiv.id+'_content');
    for(var i=0;i<pset.length;i++){
        if(pset[i].id==(pdiv.id+'_content')){
            itemp++;
            if(itemp==itab){
                pset[i].className=sclassbefore+'_content_sel';
            }
            else{
                pset[i].className=sclassbefore+'_content_nor';
            }
        }
    }
};


var lunarInfo=new Array(
0x04bd8,0x04ae0,0x0a570,0x054d5,0x0d260,0x0d950,0x16554,0x056a0,0x09ad0,0x055d2,
0x04ae0,0x0a5b6,0x0a4d0,0x0d250,0x1d255,0x0b540,0x0d6a0,0x0ada2,0x095b0,0x14977,
0x04970,0x0a4b0,0x0b4b5,0x06a50,0x06d40,0x1ab54,0x02b60,0x09570,0x052f2,0x04970,
0x06566,0x0d4a0,0x0ea50,0x06e95,0x05ad0,0x02b60,0x186e3,0x092e0,0x1c8d7,0x0c950,
0x0d4a0,0x1d8a6,0x0b550,0x056a0,0x1a5b4,0x025d0,0x092d0,0x0d2b2,0x0a950,0x0b557,
0x06ca0,0x0b550,0x15355,0x04da0,0x0a5d0,0x14573,0x052d0,0x0a9a8,0x0e950,0x06aa0,
0x0aea6,0x0ab50,0x04b60,0x0aae4,0x0a570,0x05260,0x0f263,0x0d950,0x05b57,0x056a0,
0x096d0,0x04dd5,0x04ad0,0x0a4d0,0x0d4d4,0x0d250,0x0d558,0x0b540,0x0b5a0,0x195a6,
0x095b0,0x049b0,0x0a974,0x0a4b0,0x0b27a,0x06a50,0x06d40,0x0af46,0x0ab60,0x09570,
0x04af5,0x04970,0x064b0,0x074a3,0x0ea50,0x06b58,0x055c0,0x0ab60,0x096d5,0x092e0,
0x0c960,0x0d954,0x0d4a0,0x0da50,0x07552,0x056a0,0x0abb7,0x025d0,0x092d0,0x0cab5,
0x0a950,0x0b4a0,0x0baa4,0x0ad50,0x055d9,0x04ba0,0x0a5b0,0x15176,0x052b0,0x0a930,
0x07954,0x06aa0,0x0ad50,0x05b52,0x04b60,0x0a6e6,0x0a4e0,0x0d260,0x0ea65,0x0d530,
0x05aa0,0x076a3,0x096d0,0x04bd7,0x04ad0,0x0a4d0,0x1d0b6,0x0d250,0x0d520,0x0dd45,
0x0b5a0,0x056d0,0x055b2,0x049b0,0x0a577,0x0a4b0,0x0aa50,0x1b255,0x06d20,0x0ada0)
var Animals=new Array("��","ţ","��","��","��","��","��","��","��","��","��","��");
var Gan=new Array("��","��","��","��","��","��","��","��","��","��");
var Zhi=new Array("��","��","��","î","��","��","��","δ","��","��","��","��");
var now = new Date();
var SY = now.getYear(); 
var SM = now.getMonth();
var SD = now.getDate();
 
function cyclical(num) { return(Gan[num%10]+Zhi[num%12]) } //==== ���� offset ���ظ�֧, 0=����
//==== ����ũ�� y���������
function lYearDays(y) {
   var i, sum = 348
   for(i=0x8000; i>0x8; i>>=1) sum += (lunarInfo[y-1900] & i)? 1: 0
   return(sum+leapDays(y))
}
 
//==== ����ũ�� y�����µ�����
function leapDays(y) {
   if(leapMonth(y))  return((lunarInfo[y-1900] & 0x10000)? 30: 29)
   else return(0)
}
 
//==== ����ũ�� y�����ĸ��� 1-12 , û�򴫻� 0
function leapMonth(y) { return(lunarInfo[y-1900] & 0xf)}
 
//====================================== ����ũ�� y��m�µ�������
function monthDays(y,m) { return( (lunarInfo[y-1900] & (0x10000>>m))? 30: 29 )}
 
//==== ���ũ��, �����������, ����ũ���������
//     ����������� .year .month .day .isLeap .yearCyl .dayCyl .monCyl
function Lunar(objDate) {
   var i, leap=0, temp=0
   var baseDate = new Date(1900,0,31)
   var offset   = (objDate - baseDate)/86400000
 
   this.dayCyl = offset + 40
   this.monCyl = 14
 
   for(i=1900; i<2050 && offset>0; i++) {
      temp = lYearDays(i)
      offset -= temp
      this.monCyl += 12
   }
   if(offset<0) {
      offset += temp;
      i--;
      this.monCyl -= 12
   }
 
   this.year = i
   this.yearCyl = i-1864
 
   leap = leapMonth(i) //���ĸ���
   this.isLeap = false
 
   for(i=1; i<13 && offset>0; i++) {
      //����
      if(leap>0 && i==(leap+1) && this.isLeap==false)
         { --i; this.isLeap = true; temp = leapDays(this.year); }
      else
         { temp = monthDays(this.year, i); }
 
      //�������
      if(this.isLeap==true && i==(leap+1)) this.isLeap = false
 
      offset -= temp
      if(this.isLeap == false) this.monCyl ++
   }
 
   if(offset==0 && leap>0 && i==leap+1)
      if(this.isLeap)
         { this.isLeap = false; }
      else
         { this.isLeap = true; --i; --this.monCyl;}
 
   if(offset<0){ offset += temp; --i; --this.monCyl; }
 
   this.month = i
   this.day = offset + 1
}
 
function YYMMDD(){ 
    var cl = '<font color="green" STYLE="font-size:13pt;">'; 
    if (now.getDay() == 0) cl = '<font color="#c00000" STYLE="font-size:13pt;">'; 
    if (now.getDay() == 6) cl = '<font color="green" STYLE="font-size:13pt;">';
    return(SY+'��'+(SM+1)+'��'); 
}
function weekday(){ 
    var day = new Array("������","����һ","���ڶ�","������","������","������","������");
    var cl = '<font color="green" STYLE="font-size:9pt;">'; 
    if (now.getDay() == 0) cl = '<font color="green" STYLE="font-size:9pt;">';
    if (now.getDay() == 6) cl = '<font color="red" STYLE="font-size:9pt;">'; 
    return(day[now.getDay()]); 
}
//==== ��������
function cDay(m,d){
var nStr1 = new Array('��','һ','��','��','��','��','��','��','��','��','ʮ');
var nStr2 = new Array('��','ʮ','إ','ئ','��');
var s;
if (m>10){s = 'ʮ'+nStr1[m-10]} else {s = nStr1[m]} s += '��'
switch (d) {
  case 10:s += '��ʮ'; break;
  case 20:s += '��ʮ'; break;
  case 30:s += '��ʮ'; break;
  default:s += nStr2[Math.floor(d/10)]; s += nStr1[d%10];
}
return(s);
}
function solarDay1(){
    var sDObj = new Date(SY,SM,SD);
    var lDObj = new Lunar(sDObj);
    var cl = '<font color="#9933CC" STYLE="font-size:9pt;">'; 
    var tt = '��'+Animals[(SY-4)%12]+'��'+cyclical(lDObj.monCyl)+'�� '+cyclical(lDObj.dayCyl++)+'��' ;
    return(cl+tt+'</font>');
}
function solarDay2(){
    var sDObj = new Date(SY,SM,SD);
    var lDObj = new Lunar(sDObj);
    //var cl = '<font color="green" STYLE="font-size:9pt;">'; 
    //ũ��BB'+(cld[d].isLeap?'�� ':' ')+cld[d].lMonth+' �� '+cld[d].lDay+' ��
    var tt = cyclical(SY-1900+36)+'�� '+cDay(lDObj.month,lDObj.day);
    return(tt);
}
function solarDay3(){
var sTermInfo = new Array(0,21208,42467,63836,85337,107014,128867,150921,173149,195551,218072,240693,263343,285989,308563,331033,353350,375494,397447,419210,440795,462224,483532,504758)
var solarTerm = new Array("С��","��","����","��ˮ","����","����","����","����","����","С��","â��","����","С��","����","����","����","��¶","���","��¶","˪��","����","Сѩ","��ѩ","����")
var lFtv = new Array("0101*����","0115 Ԫ����","0505 �����","0707 ��Ϧ���˽�","0715 ��Ԫ��","0815 �����","0909 ������","1208 ���˽�","1224 С��","0100*��Ϧ")
var sFtv = new Array("0101*Ԫ��","0214 ���˽�","0308 ��Ů��","0309 ż�����ֳ�һ����","0312 ֲ����","0315 ������Ȩ����","0401 ���˽�","0418 MM������","0501 �Ͷ���","0504 �����","0512 ��ʿ��","0601 ��ͯ��","0701 ������ ��ۻع����","0801 ������","0808 ���׽�","0909 ëϯ��������","0910 ��ʦ��","0928 ���ӵ���","1001*�����",
"1006 ���˽�","1024 ���Ϲ���","1112 ����ɽ����","1220 ���Żع����","1225 ʥ����","1226 ëϯ����")
 
  var sDObj = new Date(SY,SM,SD);
  var lDObj = new Lunar(sDObj);
  var lDPOS = new Array(3)
  var festival='',solarTerms='',solarFestival='',lunarFestival='',tmp1,tmp2;
  //ũ������ 
  for(i in lFtv)
  if(lFtv[i].match(/^(\d{2})(.{2})([\s\*])(.+)$/)) {
   tmp1=Number(RegExp.$1)-lDObj.month
   tmp2=Number(RegExp.$2)-lDObj.day
   if(tmp1==0 && tmp2==0) lunarFestival=RegExp.$4 
  }
  //��������
  for(i in sFtv)
  if(sFtv[i].match(/^(\d{2})(\d{2})([\s\*])(.+)$/)){
   tmp1=Number(RegExp.$1)-(SM+1)
   tmp2=Number(RegExp.$2)-SD
   if(tmp1==0 && tmp2==0) solarFestival = RegExp.$4 
  }
  //����
  tmp1 = new Date((31556925974.7*(SY-1900)+sTermInfo[SM*2+1]*60000)+Date.UTC(1900,0,6,2,5))
  tmp2 = tmp1.getUTCDate()
  if (tmp2==SD) solarTerms = solarTerm[SM*2+1]  
  tmp1 = new Date((31556925974.7*(SY-1900)+sTermInfo[SM*2]*60000)+Date.UTC(1900,0,6,2,5))
  tmp2= tmp1.getUTCDate()
  if (tmp2==SD) solarTerms = solarTerm[SM*2] 
 
  if(solarTerms == '' && solarFestival == '' && lunarFestival == '')
    festival = '';
  else
    festival = '<TABLE WIDTH=100% BORDER=0 CELLPADDING=2 CELLSPACING=0 BGCOLOR="#CCFFCC"><TR><TD align=center><marquee direction=left scrolldelay=120 behavior=alternate>'+
    '<FONT COLOR="#FF33FF" STYLE="font-size:9pt;"><b>'+solarTerms + ' ' + solarFestival + ' ' + lunarFestival+'</b></FONT></marquee></TD>'+
    '</TR></TABLE>';
         
  var cl = '<font color="green" STYLE="font-size:9pt;">';
  return(cl+festival+'</font>');
}
 
//��ʾ��ǰʱ��
function CurentTime() 
{ 
    var now = new Date(); 
    var hh = now.getHours(); 
    var mm = now.getMinutes(); 
    var ss = now.getTime() % 60000; 
    ss = (ss - (ss % 1000)) / 1000; 
    var clock = hh+':'; 
    if (mm < 10) clock += '0'; 
    clock += mm+':'; 
    if (ss < 10) clock += '0'; 
    clock += ss; 
    return(clock); 
}
 
function refreshCalendarClock() //
{ 
 document.all.ClockTime.innerHTML = CurentTime(); 
}
//��ʾ��ǰʱ��
 
function setCalendar(){
//document.write("<table border='1' cellspacing='3' width='180' bordercolor='#009B00' bgcolor='#FFFFFF' height='110' cellpadding='2'");
//document.write("<tr><td align='center'><b>"+YYMMDD()+"<br><font face='Arial' size='6' color=#FF8040>"+SD+"</font><br>");
document.write(YYMMDD()+SD+"��&nbsp;"+weekday()+"&nbsp;");
//document.write(weekday()+"<br><font id=ClockTime color=red></font>"+"<br></b>");
//document.write(solarDay1())
document.write(solarDay2())
//document.write(solarDay3())
//document.write("</td></tr></table>");
 
}
//���Դ���
function dzxr_net()
{
        if (event.button==2)alert(' ��ӭ����Ǯ������лл^_^! ')
}


 function copyUrl()
   {
    var clipBoardContent=this.location.href;
    window.clipboardData.setData("Text",clipBoardContent);
    alert("���Ƴɹ�!");
   }
   
   
def =1.4; 
max =5; 
min = .01; 
ext = "em"; 
change = .1; 
function addSize(id) { 
    element = document.getElementById(id).style; 
    if (element.fontSize == "") element.fontSize = def+ext; 
    currsize = parseFloat(element.fontSize); 

	
	    if (currsize <= max) 
        element.fontSize = (currsize+change)+ext; 

} 

function subSize(id) { 
    element = document.getElementById(id).style; 
    if (element.fontSize == "") element.fontSize = def+ext; 
    currsize = parseFloat(element.fontSize); 
    //element.lineHeight=orgdheight
	//element.lineHeight=(--orlt)+"px"
    if (currsize >= min) 
        element.fontSize = (currsize-change)+ext; 

} 