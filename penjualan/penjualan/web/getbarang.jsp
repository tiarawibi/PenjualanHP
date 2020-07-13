<%@page import="java.sql.*" %>
<%@page import="control.koneksi" %>
<%@page import="modal.barang"%>
<!DOCTYPE html>
<%
    barang barang= new barang();
    koneksi kon = new koneksi();
    ResultSet rs = null;
    String emp_id = request.getParameter("emp_id").toString();
    String data = null;
    Statement st;
    rs = kon.stmt.executeQuery("SELECT * FROM db_barang where kd_brg='" + emp_id + "'" );
    while (rs.next()){
        data = ":" + rs.getString(3) + ":" + emp_id;
    }
    out.println(data);
%>
