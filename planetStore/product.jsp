<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta HTTP-equiv="Expires" content="0">
	<meta HTTP-equiv="kiben" content="no-cache">
    <title>星球販賣所</title>
    <link rel="stylesheet" href="css/main.css"> <!-- navBar & footer-->
    <link rel="stylesheet" href="css/product.css">
	<%
				// 接收網址傳遞參數
				String pType = request.getParameter("type");
				String pNumber = request.getParameter("number");
				if( pType == null || pNumber == null ) {
					response.sendRedirect("index.jsp");
				} // if
				
				String pName = "";
				String pImage = "";
				String pDescription = "";
				String pPrice = "";
				String pQuantity = "";
				double star5 = 0;
				double star4 = 0;
				double star3 = 0;
				double star2 = 0;
				double star1 = 0;
				double total_star = 0;
				String crate = "";
				
				// 連接資料庫
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
				Connection con = DriverManager.getConnection(url,"root","1234");
				String sql="USE `Project`";
				con.createStatement().execute(sql);
				// 取得商品資訊
				sql = "SELECT * FROM `product` WHERE `type` ='"+ pType +"' AND `number` = '" + pNumber +"'";
				ResultSet rs = con.createStatement().executeQuery(sql);
				if( rs.next() ) {
					pName = rs.getString(2);
					pDescription = rs.getString(5);
					pPrice = rs.getString(4);
					pQuantity = rs.getString(6);
					pImage = rs.getString(3);
					star1 = (double)Integer.parseInt(rs.getString(11));
					star2 = (double)Integer.parseInt(rs.getString(10));
					star3 = (double)Integer.parseInt(rs.getString(9));
					star4 = (double)Integer.parseInt(rs.getString(8));
					star5 = (double)Integer.parseInt(rs.getString(7));
					crate = rs.getString(14);
					
						sql = "UPDATE `product` SET `crate` ='" + (Integer.parseInt(crate) + 1) + "' WHERE `type` ='"+ pType +"' AND `number` = '" + pNumber +"'";
						con.createStatement().execute(sql);
					
					// out.print(rs.getString(7));
					total_star = star1+star2+star3+star4+star5;
				} // if
				
				con.close();
				
				// out.print(star1);
				star1 = (star1/total_star)*100;
				star2 = (star2/total_star)*100;
				star3 = (star3/total_star)*100;
				star4 = (star4/total_star)*100;
				star5 = (star5/total_star)*100;	
				// out.print((int)star5);
			%>
	
    <style> /* rank width */
        .five {
            width: 0%; 
            background: #e6ffe6;
            box-shadow: #0f0 0px 0px 20px 0px;
            animation: five 2s ease forwards;
        }
        @keyframes five {
            to {
                width: <%out.print((int)star5);%>%;
            }
        }
        .four {
            width: 0; 
            background: #ffffe6;
            box-shadow: #ff0 0px 0px 20px 0px;
            animation: four 2s ease forwards;
        }
        @keyframes four {
            to {
                width: <%out.print((int)star4);%>%;
            }
        }
        .three {
            width: 0; 
            background-color: #ffe6e6;
            box-shadow:#f00 0px 0px 20px 0px;
            animation: three 2s ease forwards;
        }
        @keyframes three {
            to {
                width: <%out.print((int)star3);%>%;
            }
        }
        .two {
            width: 0;
            background-color: #ccf7ff;
            box-shadow: #4df 0px 0px 20px 0px;
            animation: two 2s ease forwards;
        }
        @keyframes two {
            to {
                width: <%out.print((int)star2);%>%;
            }
        }
        .one {
            width: 0;
            background: #f2e6f2;
            box-shadow: purple 0px 0px 20px 0px;
            animation: one 2s ease forwards;
        }
        @keyframes one {
            to {
                width: <%out.print((int)star1);%>%;
            }
        }
		
		/* The Modal (background) */
		.modal {
			<% 
				// 帳密輸入錯誤就自動打開modal box
				String err_code = request.getParameter("error");
				if( err_code != null ) {
					if( err_code.equals("1") || err_code.equals("2") ) {
						//session.invalidate();
						out.print("display: block; /* Hidden by default */");
					} // if
					else {
						out.print("display: none; /* Hidden by default */");
					} // else
				}// if
				else {
					out.print("display: none; /* Hidden by default */");
				} // else
				
			%>
			
			position: fixed; /* Stay in place */
			z-index: 9; /* Sit on top */
			left: 0;
			top: 0;
			width: 100%; /* Full width */
			height: 100%; /* Full height */
			overflow: auto; /* Enable scroll if needed */
			background-color: rgb(0,0,0); /* Fallback color */
			background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		}
    </style>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script> <!--符號引用-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script> // CART add .product block
        var test = '<div class="cartProduct"> \
                <div> \
                    <img src="image/tianwang.jpg" class="icon-product"> \
                </div> \
                <div> \
                    <p>天王星</p> \
                </div> \
                <div> \
                    <p>300萬</p> \
                </div> \
                <div> \
                    <span class="del-product">&times</span> \
                </div> \
            </div>' ;
       
        $(document).ready(function(){
            $("#add").click(function(event){ 
                $("#formBox").append( test ); 
                event.preventDefault() ;
            })
        });
    </script>
</head>

<%
	// 讀取已經登入的用戶資訊
	String memID = "";
	try {
		memID = (String)session.getAttribute("id");
	} catch( Exception e ) {
		memID ="";
	}
	
	out.print(memID);
	
%>

<body>
    <div class="wrapper">
        <div class="navBar">
            <ul>
                <li><a href="index.jsp">星球販賣所
				<%
					if(memID!=null && !memID.equals(""))
					{
						out.print("Hi ! " + memID);
					} // if				
				%></a></li>
				<%
					if( memID != null && !memID.equals("") ) {
						out.print("<li><a href=\"member.jsp\"><img class=\"icon\" src='image/tianwang.jpg'></a></li>");
						//out.print("<li><a id=\"logSignModalBtn\"><img class=\"icon\" src='image/tianwang.jpg'></a></li>");
					} // if
					else {
						out.print("<li><a id=\"logSignModalBtn\"><img class=\"icon\" src='image/tianwang.jpg'></a></li>");
					} // else
				%>
                <li><a id="cartModalBtn"><i class="icon fas fa-shopping-cart"></i></a></li>
                <li class="search-box">
                    <input class="search-txt" type="text" name="" placeholder="Type to search">
                    <a class="search-btn" href="#"><i class="icon fa fa-search"></i></a>
                </li>
                <li><a href="intro.jsp">Contact Us</a></li>
            </ul>
        </div>

        <!-- (Log in / Sign up) Modal -->
        <div id="logSignModal" class="modal">
            <!-- Modal content -->
            <div class="form-box">
                <span id="close">&times;</span>
                <div class="button-box">
                    <div id="btn"></div>
                    <button type="button" id="toggle-btnL" class="toggle-btn" onclick="login()">Log in</button>
                    <button type="button" id="toggle-btnR" class="toggle-btn" onclick="signup()">Sign up</button>
                </div>
                <form id="login" class="input-group" method="POST" action="check.jsp">
					<%
						if( err_code != null ) {
							if( err_code.equals("1") ) {
								out.print("<p style=\"color:white;\">&nbsp&nbsp&nbsp&nbsp帳號密碼輸入錯誤!&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp請重新輸入!!<p>");
							} // if
							else if( err_code.equals("2") ) {
								out.print("<p style=\"color:white;\">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp請先登入!!<p>");
							} // if
						} // if
					%>
                    <input type="text" name="id" class="input-field" placeholder="User ID" required>
                    <input type="password" name="pwd" class="input-field" placeholder="Enter Password" required>
                    <input type="checkbox" class="check-box"><span class="check-text">Remember Password</span>
                    <button type="submit" class="submit-btn">Log in</button>
                </form>
                <form id="signup" class="input-group" method="POST" action="new_user.jsp">
                    <input type="text" name="id"  class="input-field" placeholder="User ID" required>
                    <input type="email"  name="email"  class="input-field" placeholder="Email ID" required>
                    <input type="password" name="pwd" class="input-field" placeholder="Enter Password" required>
                    <button type="submit" class="submit-btn sign-btn">Sign up</button>
                </form>
            </div>
        </div> 

        <!-- cart Modal -->
        <div id="cartModal" class="myModal-buy-cart">
            <div id="formBox" class="form-box-cart">
                <h1>購物車</h1>
				<%
					
					String cart_pID="";
					String cart_image = "";
					String cart_pName = "";
					String cart_pPrice = "";
					
					Class.forName("com.mysql.jdbc.Driver");
					url = "jdbc:mysql://localhost/?serverTimezone=UTC";
					con = DriverManager.getConnection(url,"root","1234");
					sql="USE `Project`";
					con.createStatement().execute(sql);
					// 取得商品資訊
					if( memID != null && !memID.equals("") ) {
						sql = "SELECT * FROM `carts` WHERE `memID` ='"+ memID +"'";
						rs = con.createStatement().executeQuery(sql);
						while( rs.next() ) {
							cart_pID = rs.getString(3);
							sql = "SELECT * FROM `product` WHERE `productID` ='"+ cart_pID +"'";
							ResultSet rs1 = con.createStatement().executeQuery(sql);
							if( rs1.next() ) {
								cart_image = rs1.getString(3);
								cart_pName = rs1.getString(2);
								cart_pPrice = rs1.getString(4);
								out.print("<div class='cartProduct'>");
								out.print("<div><img src='"+ cart_image +"' class='icon-product'></div>");
								out.print("<div><!--商品名稱--><p>"+ cart_pName +"</p></div><!--金錢-->");
								out.print("<div><p>"+ cart_pPrice +"</p></div>");
								out.print("<div><span class='del-product'>&times;</span></div></div>");
							} // if
						} // if
						
						out.print("<div class='checkout'><form><button><a href='buyhistory.jsp'>結帳</a></button> <!-- id='add' --></form></div> ");
						
					} // if
					else {
						out.print("<br><br><h3>請先登入!</h3>");
					} // else
				%>
            </div>
        </div>

        <div class="content">
			
            <section class="S1">
                <div class="S1-L">
                    <img src="<%=pImage%>">
                </div>
                <div class="S1-R">
                    <h2><%=pName%></h2>
                    <hr>
                    <p class="intro"><%=pDescription%></p>
                    <p>價格：NT <%=pPrice%></p>
                    <p>數量：<%=pQuantity%></p>
                    <hr>
                    <div>
                        <form method="POST" action="add_cart.jsp?type=<%=pType%>&number=<%=pNumber%>">
                            <input type="submit" value="加入購物車" id="cartModalBtn">
                        </form>
                        <form action="">
                            <input type="submit" value="直接購買" id="cartModalBtn">
                        </form>
                    </div>
                </div>
            </section>
            <section class="S2">
                <div class="bars">
                    <div class="bar">
                        <p>5<span>&#11088;</span></p>
                        <div class="container">
                          <div class="rank five"></div>
                        </div>
                    </div>
                
                    <div class="bar">
                        <p>4<span>&#11088;</span></p>
                        <div class="container">
                          <div class="rank four"></div>
                        </div>
                    </div>
                    
                    <div class="bar">
                        <p>3<span>&#11088;</span></p>
                        <div class="container">
                          <div class="rank three"></div>
                        </div>
                    </div>
                    
                    <div class="bar">
                        <p>2<span>&#11088;</span></p>
                        <div class="container">
                          <div class="rank two"></div>
                        </div>
                    </div>
    
                    <div class="bar">
                        <p>1<span>&#11088;</span></p>
                        <div class="container">
                          <div class="rank one"></div>
                        </div>
                    </div>
                </div> <!-- class="bar" -->
            </section>

            <section class="S3">
                <form class="write-box" method="POST" action="add.jsp<%out.print("?type="+ pType +"&number=" + pNumber + "");%>" >
                    <div><img src="image/tianwang.jpg"></div> <!--應改為使用者的圖像-->
                    <div>
                        <div class="write-stars">&#11088;&#11088;&#11088;</div>
                        <div class="cmnt-block">
                            <input type="text" name="myComment" class="myComment" placeholder="寫下評論" required>
                            <button class="cmnt-btn" type="submit">送出</button>
                        </div>
                    </div>
                </form>
                <hr>
                
				
				<%
					String pID = "";
					Class.forName("com.mysql.jdbc.Driver");
					url = "jdbc:mysql://localhost/?serverTimezone=UTC";
					con = DriverManager.getConnection(url,"root","1234");
					sql="USE `Project`";
					con.createStatement().execute(sql);
					// 取得商品資訊
					sql = "SELECT * FROM `product` WHERE `type` ='"+ pType +"' AND `number` = '" + pNumber +"'";
					rs = con.createStatement().executeQuery(sql);
					if( rs.next() ) {
						pID = rs.getString(1);
					} // if
					
					sql = "SELECT * FROM `message` WHERE `productID` = '" + pID +"'";
					rs = con.createStatement().executeQuery(sql);
					while( rs.next() ) {
						out.print("<div class='message-box'>");
						out.print("<div><img src='image/tianwang.jpg'></div>"); // 應改為使用者的圖像
						out.print("<div><h6>" + rs.getString(1) + "</h6><div class='stars'>" );
						for( int i = 0; i < Integer.parseInt(rs.getString(2)); i++ ) {
							out.print("&#11088;");
						} // for
						out.print("</div><p class='comment'>" + rs.getString(3) +"</p>");
						out.print("<p>"+ rs.getString(4) +"</p></div><div><span class='heart'>&hearts;</span></div></div>");
					} // while
				
				%>
				
            </section>
        </div>

        <%
			Class.forName("com.mysql.jdbc.Driver");
			url = "jdbc:mysql://localhost/?serverTimezone=UTC";
			con = DriverManager.getConnection(url,"root","1234");
			sql="USE `Project`";
			con.createStatement().execute(sql);
			sql = "SELECT * FROM `counter` WHERE `counterID` = '1'";
			
			rs = con.createStatement().executeQuery(sql);
			int counts = 0;
			
			if( rs.next() ) {
				counts = Integer.parseInt(rs.getString(2));
				out.print(counts);
				if( session.isNew() ) {
					counts++;
				} // if
				
				sql = "UPDATE `counter` SET `count` ='" + counts + "' WHERE `counterID` = '1'";
				con.createStatement().executeUpdate(sql);
				con.close();
			} // if
			
		%>
        <footer class="footer">
            <span>Copyright © 2021 All Rights Reserved<br>
                  Tel：0800-091-000<br>
                  訪客人數: <%=counts%>
            </span>
        </footer>
    </div>

    <%
		if( memID != null && !memID.equals("") ) {
			out.print("<script src=\"js/modal_LogSign1.js\"></script> <!-- modal box的控制 -->");
		} // if
		else {
			out.print("<script src=\"js/modal_LogSign.js\"></script> <!-- modal box的控制 -->");
		} // else
	%>
    <script src="js/LogSign.js"></script> <!-- 專為login/signup的modal box -->
    <script> // CART delete .product block
        var pro = document.getElementsByClassName("product") ;
        var close = document.getElementsByClassName("close") ;
        
        for (var i = 0; i < close.length; i++) {
            close[i].onclick = function() {
                var div = pro[i] ;
                div.remove() ;
            }
        }
    </script>
</body>
</html>