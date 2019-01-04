var obj = null;

var As = document.getElementById("navmain").getElementsByTagName("a");
//获取a标签数组
obj = As[0];
for (var i = 1; i < As.length; i++) {
	if(window.location.href.indexOf(As[i])>=0)//进行比对
		obj = As[i];
}
obj.className = 'nav-link active';