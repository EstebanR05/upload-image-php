<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UPLOAD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="container p-4">
        <div class="row d-flex justify-content-center">
            <div class="card" style="width: 18rem;">
                <img src="uploads/" class="card-img-top" alt="">
                <div class="card-body">
                    <form action="index.php" method="POST" enctype="multipart/form-data">
                        <div class="row d-flex justify-content-center">
                            <label for="formFileSm" class="form-label text-center">Selecciona una imagen</label>
                        </div>
                        <input class="form-control form-control-sm" name="archivo" id="archivo" type="file" />
                        <div class="row mt-3 d-flex justify-content-center">
                            <button type="submit" name="subir" value="Subir imagen" class="btn btn-primary btn-sm w-50">
                                Guardar imagen
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <?php
    if (isset($_POST['subir'])) {
        $archivo = $_FILES['archivo']['name'];
        if (isset($archivo) && $archivo != "") {
            $tipo = $_FILES['archivo']['type'];
            $tamano = $_FILES['archivo']['size'];
            $temp = $_FILES['archivo']['tmp_name'];
            if (!((strpos($tipo, "gif") || strpos($tipo, "jpeg") || strpos($tipo, "jpg") || strpos($tipo, "png")) && ($tamano < 2000000))) {
                echo '<div><b>Error. La extensión o el tamaño de los archivos no es correcta.<br/>
        - Se permiten archivos .gif, .jpg, .png. y de 200 kb como máximo.</b></div>';
            } else {
                if (move_uploaded_file($temp, 'uploads/' . $archivo)) {
                    chmod('uploads/' . $archivo, 0777);
                    echo '<div class="row d-flex justify-content-center mt-3"><img src="uploads/' . $archivo . '" class="img-thumbnail" style="width: 400px; height: 400px;"></div>';
                } else {
                    echo '<div><b>Ocurrió algún error al subir el fichero. No pudo guardarse.</b></div>';
                }
            }
        }
    }
    ?>

</body>

</html>