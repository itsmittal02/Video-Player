<%-- 
    Document   : update_video
    Created on : Dec 18, 2021, 7:46:30 PM
    Author     : user
--%>

<%@page contentType="text/html" import="java.sql.*"  pageEncoding="UTF-8"%>
 <%
if(request.getParameter("code")==null&&request.getParameter("ccode")==null){
    response.sendRedirect("dashboard.jsp?code_err=1");
}
else{
    String code=request.getParameter("code");
    String ccode=request.getParameter("ccode");
    String email=null ;
    Cookie c[]=request.getCookies();
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
        if(request.getParameter("vtitle").length()==0||request.getParameter("description").length()==0){
            response.sendRedirect("edit_video.jsp?code="+code+"&ccode="+ccode+"&empty=1");
        }
        else{
            String vtitle=request.getParameter("vtitle");
            String description = request.getParameter("description");
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                PreparedStatement ps = cn.prepareStatement("update video set vtitle=? ,description=? where code=? AND email=? AND ccode=?");
                ps.setString(1,vtitle);
                ps.setString(2,description);
                ps.setString(3,code);
                ps.setString(4,email);
                ps.setString(5,ccode);
                
                if(ps.executeUpdate()>0){
                    response.sendRedirect("channel_video.jsp?code="+ccode+"&Video_Updated=1");
                }
                else{
                       response.sendRedirect("channel_video.jsp?code="+ccode+"&again=1");
                }
                
            }
            catch(Exception er){
                out.print(er.getMessage());
            }
        }
    }
}
    
    
%>

  
         
       
