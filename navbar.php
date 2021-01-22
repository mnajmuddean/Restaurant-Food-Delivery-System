
<style>
</style>
<nav id="sidebar" style="background-color: black" >
		
		<div class="sidebar-list" style="color: yellow">
				<a href="index.php?page=home" class="nav-item nav-home"><span class='icon-field'><i class="fa fa-home" ></i></span> Home</a>
				<a href="index.php?page=orders" class="nav-item nav-orders"><span class='icon-field'><i class="fa fa-list"></i></span>Orders</a>
				<a href="index.php?page=menu" class="nav-item nav-menu"><span class='icon-field'><i class="fa fa-list"></i></span>Menu</a>
		</div>

</nav>
<script>
	$('.nav-<?php echo isset($_GET['page']) ? $_GET['page'] : '' ?>').addClass('active')
</script>