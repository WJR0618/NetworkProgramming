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
    <link rel="stylesheet" href="css/member.css">
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
    <script>
        var a = document.getElementsByTagName("input") ;
        var btn = document.getElementsByClassName("modify") ;
        function change() {
            for ( var i = 0 ; i < a.length ; i ++ ) {
                a[i].disabled = false ;
            }
            
            a[15].className = "modify" ;
            
            
           
        }
        $(document).ready(function(){
            $("#btn-change").click(function(event){ 
                event.preventDefault() ;
            })
        })
    </script>
	<style>
	
		/* The Modal (background) */
		.modal {
			<% 
				// 帳密輸入錯誤就自動打開modal box
				String err_code = request.getParameter("error");
				if( err_code != null ) {
					if( err_code.equals("1") ) {
						session.invalidate();
						Cookie removeCookies[] = request.getCookies();
						for( int i = 0; i < removeCookies.length; i++ ) {
							removeCookies[i].setMaxAge(0);
						} // for
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
</head>
<%
	// 讀取已經登入的用戶資訊
	String memID = memID = (String)session.getAttribute("id");

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
						out.print("<li><a href=\"member.jsp\"><img class=\"icon\" src='image/tianwang.jpg'></a></li> <!-- 登入後id改href=\"self.html\"-->");
					} // if
					else {
						out.print("<li><a id=\"logSignModalBtn\"><img class=\"icon\" src='image/tianwang.jpg'></a></li> <!-- 登入後id改href=\"self.html\"-->");
					} // else
					
				
				%>
                <li><a id="cartModalBtn"><i class="icon fas fa-shopping-cart"></i></a></li>
                <li class="search-box">
                    <input class="search-txt" type="text" name="" placeholder="Type to search">
                    <a class="search-btn" href="#"><i class="icon fa fa-search"></i></a>
                </li>
                <li><a href="intro.html">Contact Us</a></li>
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
					String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
					Connection con = DriverManager.getConnection(url,"root","1234");
					String sql="USE `Project`";
					con.createStatement().execute(sql);
					// 取得商品資訊
					if( memID != null && !memID.equals("") ) {
						sql = "SELECT * FROM `carts` WHERE `memID` ='"+ memID +"'";
						ResultSet rs = con.createStatement().executeQuery(sql);
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
            <div class="left">
                <a href="member.jsp"><p>個人檔案</p></a><br>
                <a href="buyhistory.jsp"><p>訂單</p></a>
            </div>
            <div class="right">
                <div>
                   <img src="image/tianwang.jpg" class="personal-icon"> 
                </div>
                <div class="input">
                    <form method="POST" action="set_user.jsp">
						<%	
							String ori_memName = "";
							String ori_phone = "";
							String ori_birthday = "";
							String ori_nickname = "";
							String ori_pwd = "";
							String ori_email = "";
							String ori_sex = "";
							Class.forName("com.mysql.jdbc.Driver");
							url = "jdbc:mysql://localhost/?serverTimezone=UTC";
							con = DriverManager.getConnection(url,"root","1234");
							sql="USE `Project`";
							con.createStatement().execute(sql);
							sql = "SELECT * FROM `members` WHERE `id` ='"+ memID +"'";
							ResultSet rs = con.createStatement().executeQuery(sql);
							if( rs.next() ) {
								ori_memName = rs.getString(3);
								ori_phone = rs.getString(7);
								ori_birthday = rs.getString(6);
								try{
									ori_birthday = (String)ori_birthday.subSequence(0,10); // 將日期格式轉換為 yyyy-mm-dd
								} catch(Exception e) {
									ori_birthday = "";
								}
								ori_nickname = rs.getString(8);
								ori_pwd = rs.getString(2);
								ori_email = rs.getString(4);
								ori_sex = rs.getString(5);
								if( ori_sex == null ) {
									ori_sex = "男";
								} // if
							} // if
							
							//out.print(ori_birthday);
							//out.print(ori_birthday.subSequence(0,10));
							con.close();
							
						%>
						<div class="input-inside">
							<div>
                                <p>姓名:  <input disabled type="text" value="<%=ori_memName%>" name="name"> </p>
                                <p>ID: <%=memID%></p>
                                <p>電話號碼: <input disabled type="tel" value="<%=ori_phone%>" name="phone"></p>
                                <p>出生年月日: <input disabled type="date" value="<%=ori_birthday%>" name="birthday"></p>
							</div>
							<div>
								<p>暱稱:  <input disabled type="text" value="<%=ori_nickname%>" name="nickname"> </p>
								<p>密碼: <input disabled type="password" value="<%=ori_pwd%>" name="pwd"></p>
								<p>email:  <input disabled type="email" value="<%=ori_email%>" name="email"></p>
								<%
									if( ori_sex.equals("男") ) {
										out.print("<p>性別：<input disabled type='radio' checked name='sex' value='boy'> 男<input disabled type='radio' name='sex' value='girl'>女</p>");
									} // if
									else {
										out.print("<p>性別：<input disabled type='radio' name='sex' value='boy'> 男<input disabled type='radio' checked name='sex' value='girl'>女</p>");
									} // else
								%>
								
							</div>
						</div>
                        
						<div>
                            <input class="OK" disabled value="確認" type="submit" name="sumbit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="modify" id="btn-change"  onclick="change()">修改</button>
						</div>
                        
                    </form>
                    
                </div>
            </div>
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