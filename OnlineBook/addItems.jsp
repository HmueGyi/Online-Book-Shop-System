<%@page errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Book</title>
      <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    referrerpolicy="no-referrer">
    <link rel="stylesheet" href="vendor/feather-icons-web/feather.css">
    
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class=" container-fluid">
        <div class="row">
            <div class="col-12 col-xl-2 col-lg-3 vh-100 sideBar pt-2">
                <div class="row">
                    <div class="col-12 logodiv">
                        <div class="d-flex p-2 justify-content-between align-items-center">
                            <div class="logo bg-primary text-light rounded pt-1 px-1">
                                <i class=" feather-shopping-bag " style="font-size: 32px;"></i>
                                
                            </div>
                            <span class=" text-uppercase  text-primary me-lg-4 me-md-2 ms-2" style="    font-weight: 600;">Book Store</span>

                            <div class="closebtn btn p-0 d-lg-none d-block ">
                                <i class=" feather-x text-dark" style="font-size: 2em;"></i>
                            </div>
                        </div>
                    </div>
                    <!-- side Menu -->
                    <div class="">
                        
                           <div class="col-12">
							<ul>
								<li class="menu-Item-title  text-secondary">Order
									Management</li>
								<li class="menu-Item-links">
									<div>
										<i class=" feather-calendar"></i> <a href="dashboard.jsp"
											class="">Order List</a>
									</div> </li>
								<li class="menu-Item-links">
									<div>
										<i class=" feather-list"></i> <a href="datalist.jsp" class="">Book
											List</a>
									</div></li>
								<li class="menu-Item-links">
									<div>
										<i class=" feather-plus-circle"></i> <a href="addItems.jsp"
											class="">Add Book</a>
									</div></li>
									<li class="menu-Item-links">
									<div>
										<i class=" feather-list"></i> <a href="EditBookQuantity.jsp"
											class="">Edit Quantity</a>
									</div></li>
									<li class="menu-Item-links">
									<div>
										<i class=" feather-list"></i> <a href="EditBookPrice.jsp"
											class="">Edit Price</a>
									</div></li>
									<li class="menu-Item-links">
									<div>
										<i class="feather-list"></i> <a href="DeleteBook.jsp"
											class="">Delete Book</a>
									</div></li>
									<li class="menu-Item-links">
									<div>
										<i class=" feather-list"></i> <a href="logout.jsp"
											class="">Logout</a>
									</div></li>
									

							</ul>
						</div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-xl-10 col-lg-9 vh-100 content p-2">
                <div class="row sticky-top ">
                   <div class="col-12 ">
						<div class="nav-bar bg-primary p-2  rounded d-flex justify-content-between align-items-center">
                            <button class="sidebar-btn btn btn-sm  d-flex align-items-center d-lg-none">
                                <i class=" feather-menu text-light" style="font-size: 2em;"></i>
                            </button>

                            
                            <div style="color:white;">
                            	<h2>Admin Dashboard</h2>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="row">
                   <!-- <div class="row"> -->
                        <div class="col-12 pt-2">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="orderlist.jsp">Home</a></li>
                                <li class="breadcrumb-item"><a href="datalist.jsp">Book List</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Add Book</li>
                                </ol>
                            </nav>
                        </div>
                   <!-- </div> -->
                </div>
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class=" card">
                            <div class="card-body">
                                 <div class="headerSection d-flex justify-content-between align-items-center">
                                     <div class="logo d-inline-flex align-items-center">
                                         <i class=" feather-plus-circle text-primary" style=" font-size:1.5em"></i>
                                         <h4 class=" mb-0 ms-2">Add Book </h4>
                                     </div>
                                 <div>
                                     <button class=" btn-outline-primary d-flex align-items-center p-1">
                                         <i class=" feather-menu "></i>
                                     </button>
                                 </div>
                                 </div>
                                 <hr>
                                <form action="bookServlet" method="post" enctype="multipart/form-data">
                                
					<%=(request.getAttribute("success") == null) ? "" : request
					.getAttribute("success")%>
                                    
                                    <div class=" form-group">
                                         <div class="row">
                                             <div class="col-12 col-lg-6">
                                                <div>
                                                     <label for="" class=" form-label text-secondary">Choose Book's Photo</label>
                                                       <i class="feather-info text-primary" tabindex="0" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="top" data-bs-trigger="focus" data-bs-content="Supported Only Images"></i>
                                                     <input type="file" name="photo" required accept="image/*" class=" form-control">
                                                </div>
                                                <div class="mt-2">
                                                    <label for="" class=" form-label text-secondary">Book Name</label>
                                                    <input type="text" name="name" class=" form-control">
                                                </div>
                                                <div class="mt-2">
                                                    <label for="" class=" form-label text-secondary">Book id</label>
                                                    <input type="text" name="id" class=" form-control">
                                                </div>
                                                <!-- <div class="mt-2">
                                                     <label for="" class=" form-label text-secondary d-block">Type</label>
                                                     <select name="cars" id="cars" class=" form-control form-select">
                                                         <option selected="selected" disabled>Select Type</option>
                                                         <option value="volvo">Food</option>
                                                         <option value="saab">Cosmetic</option>
                                                         <option value="mercedes">Drinks</option>
                                                         <option value="audi">Clothes</option>
                                                         
                                                     </select>
                                                 </div> -->
                                                 <div class="mt-2">
                                                     <label for="" class=" form-label text-secondary d-block">Main Category</label>
                                                  
                                                     <input type="text" name="cate" id="Category"  class=" form-control">
                                                 </div>
                                                 
                                                 <!-- <div class="mt-2">
                                                     <label for="" class=" form-label text-secondary d-block">Sub Category</label>
                                                     <select name="cars" id="SubCategroy" class=" form-control form-select">
                                                         <option selected disabled>Select Sub Category</option>
                                                         <option value="volvo">Volvo</option>
                                                         <option value="saab">Saab</option>
                                                         <option value="mercedes">Mercedes</option>
                                                         <option value="audi">Audi</option>
                                                       
                                                     </select>
                                                 </div> -->
                                                 
                                             </div>
                                             <div class="col-12 col-lg-6">
                                                 <div class="row">
                                                  <div class="mt-2">
                                                     <label for="" class=" form-label text-secondary d-block">Author</label>
                                                  
                                                     <input type="text" name="author" id="Category"  class=" form-control">
                                                 </div>
                                                     <div class="">
                                                         <label for="" class=" form-label text-secondary">Quantity</label>
                                                         <input type="text " name="qty" class=" form-control">
                                                     </div>
                                                     <!-- <div class="col-lg-6 col-12">
                                                         <label for="" class=" form-label text-secondary">Unit</label>
                                                         <input type="text " class=" form-control">
                                                     </div> -->
                                                 </div>
                                                 <div class="row">
                                                     <div class="col-12">
                                                         <label for="" class="form-label text-secondary">Price</label>
                                                         <input type="text " name="price" class=" form-control">
                                                   </div>
                                                   
                                                 </div>
                                             </div>
                                         
                                         </div>
                                    </div>
                                   <div class="row mt-5">
                                     <div class="footerSection">
                                         <button class="btn btn-primary" >Add Book</button>
                                     </div>
                                   </div>
                                </form>
                               
                            </div>
                        </div>
                    </div>
                </div>
             </div>  
        </div>
       
    </div>
    <script src="/OnlineBook/additem(Admin)/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="/OnlineBook/additem(Admin)/js/autoscroll.js"></script>

    <!-- <script src="vendor/waypoint/lib/jquery.waypoints.min.js"></script>
    <script src="vendor/Counter-Up-master/jquery.counterup.js"></script> -->
    <!-- <script src="vendor/chart_js/Chart.min.js"></script> -->
    <!-- <script src="js/app.js"></script> -->
    <!-- <script>
        var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
        var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
            return new bootstrap.Popover(popoverTriggerEl)
        })
        
        //categories relationship
        let Category=['Mobile Phones','Tv','Computers'];
        let SubCategroy=[
            {name:"Samsung",categoryId:0},
            {name:'iphone',categoryId:0},
            {name:'Redmi',categoryId:0},
            {
                name:'LG',categoryId:1
            },
            {name:"Android-Tv", categoryId:1},
            {name:'Smart-Tv', categoryId:1},
            {name:'TCL', categoryId:1},

            {name:"Acer",categoryId:2},
            {name:'MacBook', categoryId:2},
            {name:'iMac', categoryId:2},
            {name: 'Asus', categoryId:2},
        ]

        Category.map( function  (mainItems, index) {
            $("#Category").append(`<option value="${index}" >${mainItems}</option>`);
        });
        SubCategroy.map(function(subItems, index) {
            $("#SubCategroy").append(`<option value="${index}" data-category="${subItems.categoryId}">${subItems.name}</option>`);
        });
        $("#Category").change(function (e) { 
            let currentMainItems=($(this).val());
            $("#SubCategroy option").hide();
            $(`[data-category= ${currentMainItems}]`).show();
            
        });
        
    </script> 


</html>-->
</body>
</html>