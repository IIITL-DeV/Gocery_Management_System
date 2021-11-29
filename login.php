<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Admin | IIITL Store and Purchase Automation System</title>
 	<link rel="icon" href="stationary_logo.png"/>

<?php include('./header.php'); ?>
<?php include('./db_connect.php'); ?>
<?php 
session_start();
if(isset($_SESSION['login_id']))
header("location:index.php?page=home");

$query = $conn->query("SELECT * FROM system_settings limit 1")->fetch_array();
		foreach ($query as $key => $value) {
			if(!is_numeric($key))
				$_SESSION['setting_'.$key] = $value;
		}
?>

</head>
<style>
	body{
		width: 100%;
	    height: calc(100%);
	    /*background: #007bff;*/
	}
	main#main{
		width:100%;
		height: calc(100%);
		background:white;
	}
	#login-right{
		position: absolute;
		right:0;
		padding-top:20px;
		width:40%;
		height: calc(100%);
		background:#E8EDF2;
		display: flex;
		align-items: center;
		flex-direction: column;
		

		
	}
	#login-left{
		position: absolute;
		left:0;
		width:60%;
		height: calc(100%);
		background:#E8EDF2;
		display: flex;
		align-items: center;
	}
	#login-right .card{
		margin: auto
	}
    .center {
		
		width: 100%;
		height: 725px;
  
}
	.admin{
		top: 20px;
		border-radius:2px;
        
		
	}
	.card{
		box-shadow: 0 50px 50px -50px darkslategray;
	}
	div.card div.card-body button{
		color: white;
		background-color: #1c1c1e;
		margin-top:40px;
		border:none;
		outline: none;
		border-radius:5px;
		
	}
	@media (max-width: 760px){
		#login-left{
			display: block;
			width: 100%;
			height:412px;
			position: relative;
		}
		#login-right {
			display: flex;
			padding-bottom:50px;
			width: 100%;
	
			position: relative;

		}
		#login-right .btn-sm{
			
			width:80px;

		}
	}
	@media (min-width: 761px) and (max-width: 1229px){
		#login-left .img{
			display: block;
			width:60%;
			height: auto;			
			
		}
		#login-left {
			display: block;
			width: 100%;
			
			
		}
		#login-right .admin{
			display: block;
			width: 20%;
			height: auto;
			margin-top:5px;
		}
		#login-right .card{
			display: block;
			
			
		}
		
	}
	@media (max-width: 420px){
		#login-left .img{
			box-sizing: border-box;
		}
		#login-right .card-body{
			padding: 10px;
			box-sizing: border-box;
			
		}
	}
	@media (min-width: 1230px){
		#login-left .img{
			width: 100%;
			height: auto;
			
		}
		#login-right .card{
			height: 50%;
			
		}
	}
	
</style>

<body>


  <main id="main" class=" bg-dark">
  		<div id="login-left">
  			
			<div class="img">
  				<img src="iiitl.jpg"  class="center"  >
				</div>
  			
  		</div>
  		<div id="login-right">
		<div class="admin" >
		     <img src="admin_logo.png" width="100px" >
		   
		   </div>
  			<div class="card col-md-7">
  				<div class="card-body">
  					<form id="login-form" >
  						<div class="form-group">
  							<label for="username" class="control-label">Username</label>
  							<input type="text" id="username" name="username" class="form-control">
  						</div>
  						<div class="form-group">
  							<label for="password" class="control-label">Password</label>
  							<input type="password" id="password" name="password" class="form-control">
  						</div>
  						<center><button class="btn-sm btn-block btn-wave col-md-4 ">Login</button></center>
  					</form>
  				</div>
  			</div>
  		</div>
   

  </main>

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>


</body>
<script>
	$('#login-form').submit(function(e){
		e.preventDefault()
		$('#login-form button[type="button"]').attr('disabled',true).html('Logging in...');
		if($(this).find('.alert-danger').length > 0 )
			$(this).find('.alert-danger').remove();
		$.ajax({
			url:'ajax.php?action=login',
			method:'POST',
			data:$(this).serialize(),
			error:err=>{
				console.log(err)
		$('#login-form button[type="button"]').removeAttr('disabled').html('Login');

			},
			success:function(resp){
				if(resp == 1){
					location.href ='index.php?page=home';
				}else if(resp == 2){
					location.href ='voting.php';
				}else{
					$('#login-form').prepend('<div class="alert alert-danger">Username or password is incorrect.</div>')
					$('#login-form button[type="button"]').removeAttr('disabled').html('Login');
				}
			}
		})
	})
</script>	
</html>