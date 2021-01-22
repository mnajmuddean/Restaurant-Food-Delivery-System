<style>
	.logo {
    margin: auto;
    font-size: 20px;
    border-radius: 70%; 
}
</style>
<link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">
<nav class="navbar fixed-top " style="padding:0; background-color: black">
  <div class="container-fluid mt-2 mb-2">
  	<div class="col-lg-12">
  		<div class="col-md-1 float-left" style="display: flex;">
  			<div class="logo">
  				<img src="assets/img/logo.png" style="border-radius: 10% ;" width="40%" height="100%"></i>
  			</div>
  		</div>
	  	<div class="col-md-2 float-right text-white">
	  		<a href="ajax.php?action=logout" class="text-white"><?php echo"Now Login : ". $_SESSION['login_name'] ?> <i class="fa fa-power-off"></i></a>
	    </div>
    </div>
  </div>
  
</nav>