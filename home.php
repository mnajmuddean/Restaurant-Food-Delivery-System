 <!-- Masthead-->
 <header class="masthead">
            <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-center text-center" >
					<img src="assets/img/logo.png" style="align-items: center ; height: 200px ; border-radius: 150px" >
					<h1 style="color: #E7DF1E ; font-family: Impact, Haettenschweiler, 'Franklin Gothic Bold', 'Arial Black', 'sans-serif' ; font-size: 100px ; background-color: #807A7A; opacity: 90% ">WELCOME TO KAMI RESTAURANT WEBSITE</h1>
                        <a class="btn btn-primary btn-xl js-scroll-trigger" href="#menu">Order Now</a>

                    </div>
                    
                </div>
        </header>
	<section class="page-section" id="menu" style="background-color: #191617;">
        <div id="menu-field" class="card-deck" >
                <?php 
                    include'admin/db_connect.php';
                    $qry = $conn->query("SELECT * FROM  product_list order by rand() ");
                    while($row = $qry->fetch_assoc()):
                    ?>
                    <div class="col-lg-3">
                     <div class="card menu-item" style="background-color: #CDC112">
                        <img src="assets/img/<?php echo $row['img_path'] ?>" class="card-img-top" alt="..." style="background-color: white" height="400px">
                        <div class="card-body" >
                          <h5 class="card-title" style="align-items:center"><?php echo $row['name'] ?></h5>
                          <p class="card-text truncate" style="align-items:center"><?php echo $row['description'] ?></p>
                          <div class="text-center" style="background-color: #D0D0D0 ">
                              <button class="btn btn-sm btn-outline-primary view_prod btn-block" data-id=<?php echo $row['id'] ?>>View</button>
                              
                          </div>
                        </div>
                        
                      </div>
                      </div>
                    <?php endwhile; ?>
        </div>
    </section>
    <script>
        
        $('.view_prod').click(function(){
            uni_modal_right('Product','view_prod.php?id='+$(this).attr('data-id'))
        })
    </script>