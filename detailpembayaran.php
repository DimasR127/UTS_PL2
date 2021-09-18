<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pembayaran</title>
</head>
<body>
    <h4>Halaman Pembayaran Siswa</h4>
        <table border = "1">
            <tr>
                <th>NISN</th>
                <th>ID PEMBAYARAN</th>
                <th>ID SPP</th>
                <th>TGL BAYAR</th>
                <th>BULAN BAYAR</th>
                <th>TAHUN BAYAR</th>
                <th>ID PETUGAS</th>
                <th>JUMLAH BAYAR</th>
            </tr>
            <?php
            $nisn= $_POST['nisn'];
        
            if($nisn == ""){
                    header("location:pembayaran.php?nisn=kosong");
                }else{
                ?>
                <tr>
                    <?php    
                    include 'koneksi.php';
                    $data = mysqli_query ($koneksi,"SELECT * FROM  tb_spp_pembayaran where nisn='$nisn'");
                    while($d=mysqli_fetch_array($data)){
                    ?>
                    <td><?php echo $nisn; ?></td>
                    <td><?php echo $d['id_pembayaran']; ?></td>
                    <td><?php echo $d['id_petugas']; ?></td>
                    <td><?php echo $d['tgl_bayar']; ?></td>
                    <td><?php echo $d['bulan_bayar']; ?></td>
                    <td><?php echo $d['tahun_bayar']; ?></td>
                    <td><?php echo $d['id_spp']; ?></td>
                    <td><?php echo $d['jumlah_bayar']; ?></td>
                    </td>
                        
                </tr>
            <?php
            }
        }
        ?>
                
        </table>
        <p><a href="index_2.php">Kembali</a></p>
</body>
</html>