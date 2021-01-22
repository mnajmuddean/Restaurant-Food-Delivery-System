
	
			<table class="table table-bordered">
		<thead>
			 <tr style="background-color: #0013AF ; color: white;">

			<th >NO</th>
			<th >NAME</th>
			<th >ADDRESS</th>
			<th >EMAIL</th>
			<th >MOBILE</th>
			<th >STATUS</th>
			<th >ACTION</th>
			</tr>
		</thead>
		<tbody>
			<?php 
			$i = 1;
			include 'db_connect.php';
			$qry = $conn->query("SELECT * FROM orders ");
			while($row=$qry->fetch_assoc()):
			 ?>
			 <tr style="background-color: #4400C3">
			 		<td style="background-color: #0013AF ; color: white;"><?php echo $i++ ?></td>
			 		<td style="color: white"><?php echo $row['name'] ?></td>
			 		<td style="color: white"><?php echo $row['address'] ?></td>
			 		<td style="color: white"><?php echo $row['email'] ?></td>
			 		<td style="color: white"><?php echo $row['mobile'] ?></td>
			 		<?php if($row['status'] == 1): ?>
			 			<td class="text-center"><span class="badge badge-success">Confirmed</span></td>
			 		<?php else: ?>
			 			<td class="text-center"><span class="badge badge-secondary">For Verification</span></td>
			 		<?php endif; ?>
			 		<td>
			 			<button class="btn btn-sm btn-primary view_order" data-id="<?php echo $row['id'] ?>" >View Order</button>
			 		</td>
			 </tr>
			<?php endwhile; ?>
		</tbody>
	</table>
		

<script>
	$('.view_order').click(function(){
		uni_modal('Order','view_order.php?id='+$(this).attr('data-id'))
	})
</script>