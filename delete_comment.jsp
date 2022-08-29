 <%-- 
    Document   : delete_comment
    Created on : 18 Mar, 2022, 11:48:39 AM
    Author     : Sharad Mittal
--%>

<%@page contentType="text/html" import="java.sql.*"pageEncoding="UTF-8"%>
<%
String email=null ;
Cookie c[]=request.getCookies();
for(int i=0;i<c.length;i++){
    if(c[i].getName().equals("login")){
        email=c[i].getValue();
        break;
    }
}
if(email==null){
    out.print("Login");
}
else{
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from youtube where email='"+email+"'");
        if(rs.next()){
            if(request.getParameter("code")!=null){
                String code = request.getParameter("code");
                PreparedStatement ps = cn.prepareStatement("delete from comment where email=? AND code=?");
                ps.setString(1,email);
                ps.setString(2,code);
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