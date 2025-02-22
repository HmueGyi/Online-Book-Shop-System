<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="controller.*" %>
<%@page import="dbConnect.*" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="Login/fontawesome-free-6.1.2-web/css/all.min.css">

    <style>

        .width-50{
            width: 50px;
        }

        .width-300{
            width: 300px;
        }

        .width-150{
            width: 150px;
        }

        td{
            vertical-align: middle !important;
        }

    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-lg-10">
            <div class="my-5">
                <h4 class="text-primary "></h4>
                
            </div>
            <div class="d-flex justify-content-between mb-3">
                <h4 class="text-primary ">Voucher for Your Order</h4>
                <a href="BookStore.jsp">
                <button class="btn btn-primary add-row-btn">
                <i class="fas fa-plus"></i></button>
                </a>
            </div>
          <form action="OrderServlet" method="get">
           <table class="table table-bordered table-hover">
 		
                <thead>
                <tr>
                 <th class="text-center">#</th>
                    
                    <th class="text-right">UserName</th>
                    <th class="text-right">Address</th>
                    <th class="text-right">Book Name</th>
                    <th class="text-right">Cost</th>
                    <th class="text-right">Quantity</th>
                    <th class="text-right">Price</th>
                </tr>
                </thead>
                 <tbody>
                    <%
                    Connection conn = DBConnection.getConn(); 
                   
                    ArrayList<Book> previousBooks = (ArrayList<Book>)session.getAttribute("previousBooks"); 
                    System.out.println("PreviousBooks"+previousBooks);
                if (previousBooks != null) {
                    System.out.println(previousBooks.size());
                    for(int i=0; i<previousBooks.size(); i++){
                    	String bid=previousBooks.get(i).getId().trim();
                    	System.out.println(previousBooks.get(i).getBookname());
                        %>
                  
                <tr>
            <td class="width-50" style="text-align:center;">
               <%=i+1 %>
                </button>
            </td>
            <td class="width-50" style="text-align:center;">
               <%=session.getAttribute("username")%>
                </button>
            </td>
            <td class="width-50" style="text-align:center;">
              <%=session.getAttribute("address")%>
                
           </td>
            <td class="width-300">
               <%=previousBooks.get(i).getBookname() %>
            </td>
            <td class="width-150 cost ">
             <%=previousBooks.get(i).getPrice() %>
            </td>
            <td class="width-150">
             
                <input type="number" class="form-control text-right quantity" name='<%=bid%>' placeholder="0" min="0" max='<%=previousBooks.get(i).getQty() %>'>
            </td>
            <td class="text-right">
                <h4 class="mb-0 price">0</h4>
            </td>
        </tr>
        
                <%}} %>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="4" class="text-center">Total</td>
                    <td class="text-right">
                        <h4 class="font-weight-bold mb-0" id="total">0</h4>
                    </td>
                </tr>
                </tfoot>
            </table>
            <input value="Order" type="submit" name="Order" class="btn btn-primary order" >&nbsp;&nbsp;&nbsp;<input value="Cancel" type="submit" name="Cancel" class="btn btn-primary order" >
          </form>  
           
        </div>
    </div>
</div>


<script src="vendor/jquery/dist/jquery.min.js"></script>

<script>
	$('.order').onclick=function(){
		alert("Your Order is successful")
	}
    function addRow() {

        $("tbody").append(`

        <tr>
            <td class="width-50">
                <button class="btn btn-outline-primary del-btn">
                    <i class="fa-regular fa-trash-can"></i>

                </button>
            </td>
            <td class="width-300">
                <input type="text" class="form-control text-capitalize product-name">
            </td>
            <td class="width-150">
                <input type="number" class="form-control text-right cost" value="" placeholder="0" min="0">
            </td>
            <td class="width-150">
                <input type="number" class="form-control text-right quantity"  value="" placeholder="0" min="0">
            </td>
            <td class="text-right">
                <h4 class="mb-0 price"></h4>
            </td>
        </tr>

        `);

    }

    function total(){
        $("#total").html($(".price").toArray().map(el=>el.innerHTML).reduce((x,y)=> Number(x)+Number(y)));

    }



  /*  $(".add-row-btn").onclick=addRow(); */

    // row ပြန်ဖျက်ရန်
    $("tbody").delegate(".del-btn","click",function () {

        // နောက်ဆုံးတစ် row ဖျက်တဲ့အချိန်း row တစ်ခုပြန်ထားတာဖြစ်ပါတယ်
        /* if($("tbody tr").toArray().length === 1){
            addRow();
        } */

        $(this).parentsUntil("tbody").remove();
        total();



    })
    $("tbody").delegate("input","keyup change",function () {
        let cost = parseInt($(this).parentsUntil("tbody").find(".cost").text());
       
        let quantity = $(this).parentsUntil("tbody").find(".quantity").val();
        $(this).parentsUntil("tbody").find(".price").html(cost * quantity);
        total();
    })

</script>

</body>
</html>