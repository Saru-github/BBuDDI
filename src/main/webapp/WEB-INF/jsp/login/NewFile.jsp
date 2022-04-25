<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>해피CGI</title>
<style>
B{

text-align: center;

}

</style>
<script language="javascript" type="text/javascript">

var imagepath = "../upload/poketmon/"
NewImg = new Array (
"1.gif",
"2.gif",
"3.gif",
"4.gif",
"5.gif",
"6.gif",
"7.gif",
"8.gif",
"9.gif",
"10.gif",

);
var ImgNum = 0;
var ImgLength = NewImg.length - 1;

var delay = 5000; //자동전환시 시간설정(1000=1초)

var lock = false;
var run;

function chgImg(direction) {
    if (document.images) {
        ImgNum = ImgNum + direction;
    if (ImgNum > ImgLength) {
        ImgNum = 0;
    }
    if (ImgNum < 0) {
        ImgNum = ImgLength;
    }
    document.slideshow.src = imagepath+NewImg[ImgNum];
   }
}

function auto() {
    if (lock == true) {
        lock = false;
        window.clearInterval(run);
    }
    else if (lock == false) {
        lock = true;
        run = setInterval("chgImg(1)", delay);
   }
}
//  End -->
</script>
</head>
<body >
<div onLoad=auto();> <!--자동으로 슬라이드 -->

<B>
<div id="img">
<img src="../upload/poketmon/1.gif" name="slideshow">
<br>
<a href="javascript:chgImg(-1)"><</a>
<a href="javascript:auto()">Auto/Stop</a>
<a href="javascript:chgImg(1)">></a>
</div>
</B><p>
</p>
</div>
</body>
</html>