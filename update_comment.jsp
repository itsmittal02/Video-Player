 <%-- 
    Document   : update_cmt
    Created on : 7 Apr, 2022, 12:47:42 PM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String email=null ;
Cookie c[] = request.getCookies();
for(int i=0;i<c.length;i++){
    if(c[i].getName().equals("login")){
        email=c[i].getValue();
        break;
    }
}
if(email==null){
    response.sendRedirect("index.jsp");
}
else{
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from youtube where email='"+email+"'");
        if(rs.next()){
            if(request.getParameter("code")!=null && request.getParameter("msg")!=null){
                String code = request.getParameter("code");
                String msg = request.getParameter("msg");
                 PreparedStatement ps = cn.prepareStatement("update comment set msg=? where email=? AND code=? ");
                ps.setString(1,msg);
                ps.setString(2,email);
                ps.setString(3,code);
                 
                if(ps.executeUpdate()>0){
                    out.print("success");
                }
            }
        }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}
    
%>