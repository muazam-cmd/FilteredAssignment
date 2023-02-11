<?php
  if(isset($_POST['submit'])) {
    // Get form data
    $supplier_id = $_POST['supplier'];
    $wholesaler_id = $_POST['wholesaler'];
    $steering_type_id = $_POST['steering_type'];
    $car_model_id = $_POST['car_model'];
    $car_sfx_id = $_POST['car_sfx'];
    $car_variant_id = $_POST['car_variant'];
    $color_id = $_POST['color'];
    $jan_2023 = $_POST['jan_2023'];
    $feb_2023 = $_POST['feb_2023'];
    $mar_2023 = $_POST['mar_2023'];
    $apr_2023 = $_POST['apr_2023'];
    $may_2023 = $_POST['may_2023'];
    $jun_2023 = $_POST['jun_2023'];
    $jul_2023 = $_POST['jul_2023'];
    $aug_2023 = $_POST['aug_2023'];
    $sep_2023 = $_POST['sep_2023'];
    $oct_2023 = $_POST['oct_2023'];
    $nov_2023 = $_POST['nov_2023'];
    $dec_2023 = $_POST['dec_2023'];

    // Connect to the database
     require_once 'config.php';


    // Insert data into the database
    $sql = "INSERT INTO quantity_data (supplier_id, wholesaler_id, steering_type_id, car_model_id, car_sfx_id, car_variant_id, color_id, jan_2023, feb_2023,mar_2023,apr_2023,may_2023,jun_2023,jul_2023,aug_2023, sep_2023,oct_2023,nov_2023, dec_2023)
            VALUES ($supplier_id, $wholesaler_id, $steering_type_id, $car_model_id, $car_sfx_id, $car_variant_id, $color_id, $jan_2023, $feb_2023,$mar_2023,$apr_2023,$may_2023,$jun_2023,$jul_2023,$aug_2023, $sep_2023,$oct_2023,$nov_2023, $dec_2023)";

    if (mysqli_query($conn, $sql)) {
      echo "New record created successfully";
    } else {
      echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }

    // Close connection
    mysqli_close($conn);
  }
?>
