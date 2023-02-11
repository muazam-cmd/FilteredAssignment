<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            select {
            padding: 10px;
            margin: 10px 0;
            font-size: 14px;
            width: 200px;
            }
            table, th, td {
            border:1px solid black;
            }
        </style>
        <script>
            $(document).ready(function() {
              // hide the second and third dropdown menus initially
              $("#wholesaler").hide();
              $("#steering_type").hide();
            
              // show the second dropdown menu when a value is selected in the first dropdown menu
              $("#supplier").change(function() {
                $("#wholesaler").show();
              });
            
              // show the third dropdown menu when a value is selected in the second dropdown menu
              $("#wholesaler").change(function() {
                $("#steering_type").show();
              });
            });
        </script>
        <script>
            $(document).ready(function() {
            $("#supplier").change(function() {
            if ($(this).val() != "") {
              $("#wholesaler").show();
            } else {
              $("#wholesaler").hide();
              $("#steering_type").hide();
            }
            });
            
            $("#wholesaler").change(function() {
            if ($(this).val() != "") {
              $("#steering_type").show();
            } else {
              $("#steering_type").hide();
            }
            });
            });
            
        </script>
        <script>
            $(document).ready(function() {
              // submit the selected values from the dropdown menus
              $("#submit_btn").click(function() {
                var supplier = $("#supplier").val();
                var wholesaler = $("#wholesaler").val();
                var steering_type = $("#steering_type").val();
            
                // pass the selected values to a PHP script for processing
                $.ajax({
                  type: "POST",
                  url: "filter_results.php",
                  data: {
                    supplier: supplier,
                    wholesaler: wholesaler,
                    steering_type: steering_type
                  },
                  success: function(data) {
                    data = JSON.parse(data);
            var tableBody = $('#records_table tbody');
            tableBody.empty();

            for (var i = 0; i < data.length; i++) {
              var record = data[i];
              var row = $('<tr>');
              row.append($('<td>').text(i));
              row.append($('<td>').text(record.supplier));
              row.append($('<td>').text(record.wholesaler));
              row.append($('<td>').text(record.steering_type));
              row.append($('<td>').text(record.car_model));
              row.append($('<td>').text(record.car_sfx));
              row.append($('<td>').text(record.car_variant));
              row.append($('<td>').text(record.color));
              row.append($('<td>').text(record.jan));
              row.append($('<td>').text(record.feb));
              row.append($('<td>').text(record.mar));
              row.append($('<td>').text(record.apr));
              row.append($('<td>').text(record.may));
              row.append($('<td>').text(record.jun));
              row.append($('<td>').text(record.jul));
              row.append($('<td>').text(record.aug));
              row.append($('<td>').text(record.sep));
              row.append($('<td>').text(record.oct));
              row.append($('<td>').text(record.nov));
              row.append($('<td>').text(record.dec)); 
              tableBody.append(row);
            }

                  }
                });
              });
                        // Add a new empty row to the table
$("#add-row-button").click(function() {
  var newRow = "<tr> <td>New</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
 
  $("#records_table").append(newRow);
});
            });
            
        </script>
 <script>
            $(document).ready(function() {
            // Make table cells editable on click
            $(".editable").click(function() {
            $(this).prop("contentEditable", true);
            });
            
            // Save changes when focus is lost
            $(".editable").focusout(function() {
            $(this).prop("contentEditable", false);
            });
            
            // Save changes manually with a button
            $("#save-changes").click(function() {
            $(".editable").prop("contentEditable", false);
            });
            });
            
        </script>
        <script>
            $(document).ready(function() {
            // Save changes manually with a button
            $("#save-changes").click(function() {
            // Get the updated data from the table cells
            var data = [];
            $(".editable").each(function() {
            data.push($(this).text());
            });
            
            // Send the data to the server for update
            $.ajax({
            url: "store.php",
            method: "POST",
            data: { updated_data: data },
            success: function(response) {
            alert("Data updated successfully!");
            }
            });
            });
            });
            
        </script>
        <script>
            $(document).ready(function() {
            // Add new row
            $("#add-row").click(function() {
            var newRow = "<tr><td class='editable'></td><td class='editable'></td><td class='editable'></td><td class='editable'></td><td class='editable'></td><td class='editable'></td><td class='editable'></td><td class='editable'></td><td class='editable'></td><td class='editable'></td><td class='editable'></td><td class='editable'></td></tr>";
            $("table tbody").append(newRow);
            });
            });
            
        </script>
 
        <script>
          $(document).ready(function() {
            // Listen for click events on table cells
            $('td').click(function() {
              // Get the current value of the cell
              var currentValue = $(this).text();
              
              // Replace the contents of the cell with an input field
              $(this).html('<input type="text" value="' + currentValue + '">');
              
              // Listen for when the input field loses focus
              $('input').blur(function() {
                // Get the updated value from the input field
                var updatedValue = $(this).val();
                
                // Update the database with the new value
                // (This would typically be done using an AJAX request to a PHP script that updates the database)
                $.ajax({
                  url: 'update_database.php',
                  method: 'post',
                  data: { newValue: updatedValue },
                  success: function(data) {
                    // Show a success message or update the table with the updated value
                  }
                });
              });
            });
          });

        </script>
   
      
      
      
    </head>
    <body>
        <?php 
            require_once 'config.php';
            
            $query1 = "SELECT * FROM suppliers";
            $result1 = mysqli_query($conn, $query1);
            
            $query2 = "SELECT * FROM wholesalers";
            $result2 = mysqli_query($conn, $query2);
            
            $query3 = "SELECT * FROM steering_types";
            $result3 = mysqli_query($conn, $query3); 
            
            ?>
        <select id="supplier">
            <option value="">Select Supplier</option>
            <?php 
                while ($row1 = mysqli_fetch_assoc($result1)) {
                  echo  "<option value=".$row1['id'].">". $row1['name']."</option>" ;
                }
                ?> 
        </select>
        <select id="wholesaler">
            <option value="">Select Whole Seller</option>
            <?php 
                while ($row2 = mysqli_fetch_assoc($result2)) {
                  echo  "<option value=".$row2['id'].">". $row2['name']."</option>" ;
                }
                ?> 
        </select>
        <select id="steering_type">
            <option value="">Select Steering Type</option>
            <?php 
                while ($row3 = mysqli_fetch_assoc($result3)) {
                  echo  "<option value=".$row3['id'].">". $row3['name']."</option>" ;
                }
                ?> 
        </select>
        <button type="submit" id="submit_btn">Submit</button>
        <br>
        <select id="car_model" style="display: none;">
            <option value="">Select Car Model</option>
        </select>
        <br>
        <button id="add-row-button">Add Row</button>
        <table id="records_table">
            <thead>
                <tr>
                  <th>#</th>
                    <th>Supplier</th>
                    <th>Whole Seller</th>
                    <th>Steering Type</th>
                    <th>Car Model</th>
                    <th>Car SFX</th>
                    <th>Car Variant</th>
                    <th>Color</th>
                    <th>Jan 2023</th>
                    <th>Feb 2023</th>
                    <th>Mar 2023</th>
                    <th>Apr 2023</th>
                    <th>May 2023</th>
                    <th>Jun 2023</th>
                    <th>Jul 2023</th>
                    <th>Aug 2023</th>
                    <th>Sep 2023</th>
                    <th>Oct 2023</th>
                    <th>Nov 2023</th>
                    <th>Dec 2023</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <br><br>
        <table id="record-table">
  <thead>
    <tr>
      <th>Month</th>
      <th>Quantity</th>
    </tr>
  </thead>
  <tbody>
    <?php
      $months = array("Jan 2023", "Feb 2023", "Mar 2023", "Apr 2023", "May 2023", "Jun 2023", "Jul 2023", "Aug 2023", "Sep 2023", "Oct 2023", "Nov 2023", "Dec 2023");
      foreach ($months as $month) {
    ?>
        <tr>
          <td><?php echo $month; ?></td>
          <td><input type="text" name="quantity[]" value="0"></td>
        </tr>
    <?php
      }
    ?>
  </tbody>
</table>

    </body>
</html> 