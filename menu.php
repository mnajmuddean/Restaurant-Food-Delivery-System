<link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">
<?php include('db_connect.php');?>

<div class="container-fluid">
	
	<div class="col-lg-12">
		<div class="row">
			<!-- FORM Panel -->
			<div class="col-md-4">
			<form action="" id="manage-menu">
				<div class="card">
					<div class="card-header" style="background-color: #1D1D1D ; color: white">
						    Menu Form
				  	</div>
					<div class="card-body" style="background-color: #00203FFF ; color: white">
							<input type="hidden" name="id">
							<div class="form-group">
								<label class="control-label">Menu Name</label>
								<input type="text" class="form-control" name="name">
							</div>
							<div class="form-group">
								<label class="control-label">Menu Description</label>
								<textarea cols="30" rows="3" class="form-control" name="description"></textarea>
							</div>
							<div class="form-group">
								<div class="custom-control custom-switch">
								  <input type="checkbox" name="status" class="custom-control-input" id="availability" checked>
								  <label class="custom-control-label" for="availability">Available</label>
								</div>
							</div>	
							<div class="form-group">
								<label class="control-label">Price</label>
								<input type="number" class="form-control text-right" name="price" step="any">
							</div>
							<div class="form-group">
								<label for="" class="control-label">Image</label>
								<input type="file" class="form-control" name="img" onchange="displayImg(this,$(this))">
							</div>
							<div class="form-group">
								<img src="<?php echo isset($image_path) ? '../assets/img/'.$cover_img :'' ?>" alt="" id="cimg">
							</div>
					</div>
							
					<div class="card-footer" style="background-color: #00203FFF ; color: white">
						<div class="row">
							<div class="col-md-12">
								<button class="btn btn-sm btn-primary col-sm-3 offset-md-3"> Save</button>
								<button class="btn btn-sm btn-default col-sm-3" style="background-color: white" type="button" onclick="$('#manage-menu').get(0).reset()"> Cancel</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			</div>
			<!-- FORM Panel -->

			<!-- Table Panel -->
			<div class="col-md-8" >
				<div class="card" style="background-color: #B3A100">
					<div class="card-body">
						<table class="table table-bordered table-hover">
							<thead>
								<tr style="background-color:  #401EB3 ; color: white;">
									<th class="text-center">NO</th>
									<th class="text-center">IMAGE</th>
									<th class="text-center">ITEM</th>
									<th class="text-center">ACTION</th>
								</tr>
							</thead>
							<tbody>
								<?php 
								$i = 1;
								$cats = $conn->query("SELECT * FROM product_list order by id asc");
								while($row=$cats->fetch_assoc()):
								?>
								<tr>
									<td class="text-center" style="background-color: #401EB3 ; color: white;"><?php echo $i++ ?></td>

								
									<td class="text-center" style="background-color: #365BB1">
										<img src="<?php echo isset($row['img_path']) ? '../assets/img/'.$row['img_path'] :'' ?>" alt="" id="cimg">
									</td>
									<td class="" style="background-color: #365BB1 ; color: white">
										<p style="color: white">NAME : <b><?php echo $row['name'] ?></b></p>
										<p style="color: white">DESCRIPTION : <b class="truncate"><?php echo $row['description'] ?></b></p>
										<p style="color: white">Price : <b><?php echo "RM ".number_format($row['price'],2) ?></b></p>
									</td>
									<td class="text-center" style="background-color: #365BB1">
										<button class="btn btn-sm btn-primary edit_menu" type="button" data-id="<?php echo $row['id'] ?>" data-name="<?php echo $row['name'] ?>" data-status="<?php echo $row['status'] ?>" data-description="<?php echo $row['description'] ?>" data-price="<?php echo $row['price'] ?>" data-img_path="<?php echo $row['img_path'] ?>">Edit</button>
										<button class="btn btn-sm btn-danger delete_menu" type="button" data-id="<?php echo $row['id'] ?>">Delete</button>
									</td>
								</tr>
								<?php endwhile; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Table Panel -->
		</div>
	</div>	

</div>
<style>
	img#cimg,.cimg{
		max-height: 10vh;
		max-width: 6vw;
	}
	td{
		vertical-align: middle !important;
	}
	td p{
		margin: unset !important;
	}
	.custom-switch,.custom-control-input,.custom-control-label{
		cursor:pointer;
	}
	b.truncate {
		 overflow: hidden;
   text-overflow: ellipsis;
   display: -webkit-box;
   -webkit-line-clamp: 3; 
   -webkit-box-orient: vertical;	
    font-size: small;
    color: #000000cf;
    font-style: italic;
}
</style>
<script>
	function displayImg(input,_this) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	$('#cimg').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	}
	$('#manage-menu').submit(function(e){
		e.preventDefault()
		start_load()
		$.ajax({
			url:'ajax.php?action=save_menu',
			data: new FormData($(this)[0]),
		    cache: false,
		    contentType: false,
		    processData: false,
		    method: 'POST',
		    type: 'POST',
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully added",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
				else if(resp==2){
					alert_toast("Data successfully updated",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	})
	$('.edit_menu').click(function(){
		start_load()
		var cat = $('#manage-menu')
		cat.get(0).reset()
		cat.find("[name='id']").val($(this).attr('data-id'))
		cat.find("[name='description']").val($(this).attr('data-description'))
		cat.find("[name='name']").val($(this).attr('data-name'))
		cat.find("[name='price']").val($(this).attr('data-price'))
		if($(this).attr('data-status') == 1)
			$('#availability').prop('checked',true)
		else
			$('#availability').prop('checked',false)

		cat.find("#cimg").attr('src','../assets/img/'+$(this).attr('data-img_path'))
		end_load()
	})
	$('.delete_menu').click(function(){
		_conf("Are you sure to delete this menu?","delete_menu",[$(this).attr('data-id')])
	})
	function delete_menu($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_menu',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
</script>