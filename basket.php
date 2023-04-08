<?php
session_start();
include("db.php");

$pagename="Your Smart Basket"; //Create and populate a variable called $pagename

echo "<link rel=stylesheet type=text/css href=mystylesheet.css>"; //Call in stylesheet

echo "<title>".$pagename."</title>"; //display name of the page as window title

echo "<body>";

include ("headfile.html"); //include header layout file
include("detectlogin.php");

echo "<h4>".$pagename."</h4>"; //display name of the page on the web page


if (isset($_POST['delProdId'])) {
    $delProdId = $_POST['delProdId'];
    unset($_SESSION['basket'][$delProdId]);
    // echo "<p>1 Item removed from basket</p>";
} 


// if the posted ID of the new product is set i.e. if the user is adding a new product into the basket
if (isset($_POST['h_prodid'])) {
    //retrieve the product id passed from previous page using the POST method and the $_POST superglobal variable
    //store the value in a local variable called $newprodId
    $newprodId=$_POST['h_prodid'];
    //display the value of the product id, for debugging purposes
    // echo "<p>Selected product Id: ".$newprodId."</p>";

    //retrieve the product quantity passed from previous page using the POST method and the $_POST superglobal variable
    //store the value in a local variable called $reququantity
    $reququantity=$_POST['p_quantity'];
    //display the value of the product id, for debugging purposes
    // echo "<p>Quantity of selected product: ".$reququantity."</p>";

    // create a new cell in the basket section array. Index this cell with the new product Id. 
    // inside the cell store the required product quantity
    $_SESSION['basket'][$newprodId]=$reququantity;
    // echo "<p>1 item added</p>";

}
$total = 0;

// make table
echo
"<p><table id = 'baskettable'>
<tr>
    <th>Product Name</th>
    <th>Product Price</th>
    <th># of Items</th>
    <th>Subtotal</th>
    <th>Remove Product</th>
</tr>
";

if (isset($_SESSION['basket']))
{
    foreach($_SESSION['basket'] as $key => $value)
    {
        $SQL = "SELECT prodId, prodName, prodPrice
                FROM Product
                WHERE prodId = ".$key;
        $exeSQL = mysqli_query($conn, $SQL);
        echo "<tr>";
        $arrayp = mysqli_fetch_array($exeSQL);
        echo "<td>".$arrayp['prodName']."</td>";
        echo "<td>$".$arrayp['prodPrice']."</td>";
        echo "<td>".$value."</td>";
        $subtotal = $value * $arrayp['prodPrice'];
        echo "<td>$".$subtotal."</td>";

        echo"<td><form action = 'basket.php' method = 'post'>";
        echo "<input type = 'submit' value = 'Remove' id = 'submitbtn'>";
        echo "<input type = 'hidden' name = 'delProdId' value = ".$key.">";
        echo "</form></td>";

        echo "</tr>";
        $total = $total + $subtotal;
    }
    

}

if (isset($_SESSION['basket']) and count($_SESSION['basket'])>0)
{
    // print total 
    echo "<tr>";
    echo "<td colspan = 3>TOTAL</td>";
    echo "<td>$".number_format($total, 2)."</td>";
    //echo "<td></td>";
    echo "<td><a href = clearbasket.php><input type='submit' value = 'Clear Basket' id ='submitbtn'></a></p>";
    

    if (isset($_SESSION['userid']))
    {
        //echo "<p class='updateInfo'><a href=checkout.php>CHECKOUT</a></p></td>";
        echo "<a href = checkout.php><input type='submit' value = 'Checkout' id ='submitbtn'></a></p>";
        echo "</table>";
    }
    else
    {
        echo "</table>";
        echo "<p class='updateInfo'>New homteq customers: <a href='signup.php'>Sign up</a></p>";
        echo "<p class='updateInfo'>Returning homteq customers: <a href='login.php'>Login</a></p>";
    }
    echo "</tr>";
    echo "</p>";
}
else 
{
    echo "<tr>";
    echo "<td colspan = 5>Your Basket is Empty!</td>";
    echo "</tr>";
}
echo "</table>";
include("footfile.html"); //include head layout
echo "</body>";
?>
