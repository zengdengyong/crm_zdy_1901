<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="jumbotron" onload="time()">
      <h1>Hello, world!</h1>
      <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
      <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
      <!--时间显示  -->
      <h2>
	      <div id="showtime" style="color: green"></div>
      </h2>
    </div>
    
    
<!-- 显示当前时间! -->


<script>
/*这么做有一个bug, */
       var t_div = document.getElementById('showtime');
    function time() {
        //获得显示时间的div
        var now = new Date()
        //替换div内容 
	t_div.innerHTML ="现在是"+now.getFullYear()+"年"+(now.getMonth()+1)+"月"+now.getDate()+"日"+now.getHours()+"时"+now.getMinutes()+"分"+now.getSeconds()+"秒";
		//等待一秒钟后调用time方法，由于settimeout在time方法内，所以可以无限调用
		setTimeout(time, 1000);
	} 
</script>
	

</html>