<%@page import="control.koneksi"%>
<%@page import="java.sql.*"%>
<%
    String kodebarang=request.getParameter("kd_brg");
    String namabarang = null;
    String harga = null ;
    String stok= null ;
    ResultSet rs = null;
    koneksi kon = new koneksi();
        
            rs = kon.stmt.executeQuery("SELECT * FROM db_barang where kd_brg='" + kodebarang +"'");
                if(rs.next()){
                    kodebarang=rs.getString(1);
                    namabarang=rs.getString(2);
                    harga=rs.getString(3);
                    stok=rs.getString(4);
                }
        
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ubah Data Master Barang</title>
    </head>
    <body>
        <form methode="POST" action="barangServlet">
            <table border=2>
                <tr>
                    <td colspan="3"><h3>Ubah Data Barang</h3></td>
                </tr>
                <tr>
                    <td>Kode barang</td>
                    <td>:</td>
                    <td>
                        <input type=text value="<%=kodebarang%>" readyonly>
                        <input type="hidden" name="kodebarang" value="<%=kodebarang%>"/>
                    </td>
                </tr>
                <tr>
                    <td>Nama barang</td>
                    <td>:</td>
                    <td><input type=text name=namabarang value="<%=namabarang%>"/></td>
                </tr>
                <tr>
                    <td>Harga</td>
                    <td>:</td>
                    <td><input type=text name=harga value="<%=harga%>"/></td>
                </tr>
                <tr>
                    <td>Stock</td>
                    <td>:</td>
                    <td><input type=text name=stok value="<%=stok%>"/></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <input type=submit name="aksi" value="Upadate">
                        <a href="beranda.jsp?hal=tampilbrg">[LIHAT BARANG]</a>
                    </td>
                </tr>
            
            </table>
        </form>
        
    </body>
</html>
