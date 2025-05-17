<?php
$host = "localhost";
$db = "certdb";
$user = "root";
$pass = "";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$data = json_decode(file_get_contents("php://input"), true);

$companyName = $conn->real_escape_string($data['companyName']);
$companyAddress = $conn->real_escape_string($data['companyAddress']);
$purchaseOrderNumber = $conn->real_escape_string($data['purchaseOrderNumber']);
$salesOrderNumber = $conn->real_escape_string($data['salesOrderNumber']);
$formDate = $conn->real_escape_string($data['formDate']);

$conn->query("INSERT INTO warranty_certificates (company_name, company_address, purchase_order_number, sales_order_number, form_date)
              VALUES ('$companyName', '$companyAddress', '$purchaseOrderNumber', '$salesOrderNumber', '$formDate')");
$certificateId = $conn->insert_id;

foreach ($data['products'] as $product) {
    $desc = $conn->real_escape_string($product['description']);
    $qty = (int)$product['quantity'];
    $serial = $conn->real_escape_string($product['serial']);
    $warranty = $conn->real_escape_string($product['warranty']);

    $conn->query("INSERT INTO warranty_products (certificate_id, product_description, quantity, serial_numbers, warranty_info)
                  VALUES ($certificateId, '$desc', $qty, '$serial', '$warranty')");
}

echo json_encode(["status" => "success"]);
?>
