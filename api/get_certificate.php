<?php
$host = "localhost";
$db = "certdb";
$user = "root";
$pass = "";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(["error" => "DB connection failed"]);
    exit;
}

$id = intval($_GET['id']);

$certQuery = $conn->query("SELECT * FROM warranty_certificates WHERE id = $id");
$productQuery = $conn->query("SELECT * FROM warranty_products WHERE certificate_id = $id");

if ($certQuery->num_rows === 0) {
    http_response_code(404);
    echo json_encode(["error" => "Not found"]);
    exit;
}

$certificate = $certQuery->fetch_assoc();
$products = [];

while ($row = $productQuery->fetch_assoc()) {
    $products[] = $row;
}

echo json_encode([
    "certificate" => $certificate,
    "products" => $products
]);
?>
