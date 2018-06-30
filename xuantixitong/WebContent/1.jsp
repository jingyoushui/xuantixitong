
<div id="demo" style="overflow: hidden; height: 150; width: 230; background: red; color: #ffffff">
				<div id="demo1">
					<img src="./image/index/1.png"> <img
						src="./image/index/2.png"> <img src="./image/index/3.png">
					<img src="./image/index/4.png">
					<img src="./image/index/5.png">

				</div>
				<div id="demo2"></div>
			</div>
			<script>
				var speed = 50
				demo2.innerHTML = demo1.innerHTML
				function Marquee() {
					if (demo2.offsetTop - demo.scrollTop <= 0)
						demo.scrollTop -= demo1.offsetHeight
					else {
						demo.scrollTop++
					}
				}
				var MyMar = setInterval(Marquee, speed)
				demo.onmouseover = function() {
					clearInterval(MyMar)
				}
				demo.onmouseout = function() {
					MyMar = setInterval(Marquee, speed)
				}
			</script>
