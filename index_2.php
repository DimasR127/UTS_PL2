<!DOCTYPE html>
<html>
<head>
	<title>Admin</title>
</head>
<body>
	<h2>Halaman Admin</h2>
	
	<br/>
    
	<!-- cek apakah sudah login -->
	<?php 
	session_start();
	if($_SESSION['status']!="login"){
		header("location:../index.php?pesan=belum_login");
	}
	?>
 
	<h4>Selamat datang, <?php echo $_SESSION['username']; ?>! anda telah login.</h4>
    <tr>
        <td><a href = "siswa.php">Siswa</a></td>
		<td><a href = "pembayaran.php">Pembayaran</a></td>
    </tr>    
	<br/>
	<br/>
 
	<a href="logout.php">LOGOUT</a>
 
 
</body>
</html>