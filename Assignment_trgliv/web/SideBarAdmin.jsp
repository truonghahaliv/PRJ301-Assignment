

<div class="d-flex flex-column flex-shrink-0 p-3 text-white"  style="height: 100vh; width: 250px; background-color: #8c8377">
    <div class="d-flex flex-column justify-content-center align-items-center">
        <img src="img/${sessionScope.account.avatar}" alt="alt" style="width: 150px;height: 150px;border-radius: 50%;object-fit: cover;display: block"/>
        <p style="text-align: center;font-size: 20px;margin-top: 10px">Hello, ${sessionScope.account.username}</i> </p>
    </div>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        
        
        <li >
            <a href="home" class="nav-link d-flex align-items-center" >
                <i class="fa-solid fa-house pe-3" style="margin-right: 10px"></i>
                Home
            </a>
        </li>
        <li >
            <a href="dashboard" class="nav-link d-flex align-items-center" >
                <i class="fa-solid fa-chart-simple" style="margin-right: 10px"></i>
                Dashboard
            </a>
        </li>
        <li>
            <a href="list-order" class="nav-link sidebarBtn">
                <i class="fa-solid fa-cart-plus pe-3" style="margin-right: 10px"></i>                            
                Orders
            </a>
        </li>
        <li>
            <a href="list-product" class="nav-link sidebarBtn" style="">
                <i class="fa-brands fa-product-hunt pe-3" style="margin-right: 10px"></i>
                Products
            </a>
        </li>
        <li>
            <a href="list-user" class="nav-link sidebarBtn" >
                <i class="fa-solid fa-user pe-3" style="margin-right: 10px"></i>
                Customers
            </a>
        </li>
    </ul>
    <hr>
</div>       
