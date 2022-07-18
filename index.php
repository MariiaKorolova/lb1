<?php
require_once __DIR__ . "/DbAccess.php";
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>LB1</title>
</head>
<body>
<?php
$db = new DbAccess();
?>
<form action="" method="post">
Статистика работы в сети
    <select name="client">
        <?php
        $db->client();
        ?>
    </select>
    <input type="submit" value="Подтвердить"><br>
</form>
<br>
<?php
if (isset($_POST["client"])) {
    $db->statisticByClient($_POST["client"]);
}
?>
<br>
<form action="" method="post">
    <label>Статистика работы в сети за указанный промежуток времени:</label>
    <input type="datetime-local" name="start">
    <input type="datetime-local" name="stop">
    <input type="submit" value="Подтвердить"><br>
</form>
<br>
<?php
if (isset($_POST["start"])) {
    $db->statisticByTime($_POST["start"], $_POST["stop"]);
}
?>
<br>
<form action="" method="post">
Список клиентов с отрицательным балансом счета:
    <input type="submit" value="Подтвердить" name="balance"><br>
</form>
<br>
<?php
if (isset($_POST["balance"])) {
    $db->balance();
}
?>
</body>
</html>
