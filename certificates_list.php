<?php
$host = "localhost";
$db = "certdb";
$user = "root";
$pass = "";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$query = "SELECT id, company_name, purchase_order_number, sales_order_number, form_date FROM warranty_certificates ORDER BY id DESC";
$result = $conn->query($query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Warranty Certificate List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <style>
    body {
      padding: 40px;
    }
    .table td, .table th {
      vertical-align: middle;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2 class="mb-4">Generated Warranty Certificates</h2>
    <?php if ($result->num_rows > 0): ?>
      <table class="table table-bordered table-hover table-striped">
        <thead class="table-dark">
          <tr>
            <th>#</th>
            <th>Company Name</th>
            <th>P.O. Number</th>
            <th>S.O. Number</th>
            <th>Date</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <?php while($row = $result->fetch_assoc()): ?>
            <tr>
              <td><?= htmlspecialchars($row['id']) ?></td>
              <td><?= htmlspecialchars($row['company_name']) ?></td>
              <td><?= htmlspecialchars($row['purchase_order_number']) ?></td>
              <td><?= htmlspecialchars($row['sales_order_number']) ?></td>
              <td><?= htmlspecialchars($row['form_date']) ?></td>
              <td>
                <a href="certificate/certificate.html?id=<?= $row['id'] ?>" class="btn btn-primary btn-sm">
                  View Certificate
                </a>
              </td>
            </tr>
          <?php endwhile; ?>
        </tbody>
      </table>
    <?php else: ?>
      <div class="alert alert-warning">No certificates found.</div>
    <?php endif; ?>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
