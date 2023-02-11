<?php
    $conn = mysqli_connect("localhost", "root", "", "muazzam");

    // Get the selected options
      $supplier = $_POST["supplier"];
      $wholesaler = $_POST["wholesaler"];
      $steering_type = $_POST["steering_type"];
      
      // Build the query
      $query = "SELECT * FROM filter_data WHERE supplier='$supplier' AND wholesaler='$wholesaler' AND steering_type='$steering_type'";
      
      // Execute the query
      $result = mysqli_query($conn, $query);
      $data = array();
      while($row = mysqli_fetch_assoc($result)){
            $data[] = $row;
        }

     echo json_encode($data);
      
      // Close the connection
      mysqli_close($conn);
?>