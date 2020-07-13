<%@page import="control.koneksi"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Barang</title>
    </head>
    <body>
        <table width="700" height="150" border="0" align="center">
            <tr align="cente">
                <td colspan="5" align="center"><h3>Data Barang</h3></td>
            </tr>
            <tr>
                <th>Kode Barang</th>
                <th>Nama Barang</th>
                <th>Harga</th>
                <th>Stok</th>
                <th>Aksi</th>
            </tr>
            
            <% 
                String kodebarang = null;
                String namabarang = null;
                String harga = null;
                String stok = null;
                ResultSet rs = null;
                
                koneksi kon = new koneksi();
                rs = kon.stmt.executeQuery("SELECT * FROM db_barang ORDER BY kd_brg asc");
                
                    while(rs.next())
                    {
                        kodebarang=rs.getString("kd_brg");
                        namabarang=rs.getString(2);
                        harga=rs.getString(3);
                        stok=rs.getString(4);
            %>
            <tr>
                <td align="center"><% out.println(kodebarang);%></td>
                <td align="center"><% out.println(namabarang);%></td>
                <td align="center"><% out.println(harga);%></td>
                <td align="center"><% out.println(stok);%></td>
                <td align="center"><a href="beranda.jsp?hal=editbarang&kd_brg=<% out.print(kodebarang);%>">EDIT</a>||
                    <a href="barangServlet?aksi=Delete&kd_brg=<% out.print(kodebarang);%>">DELETE</a></td>
            </tr>            
                <%}%>
                
                <tr>
                    <td colspan="6" align="center"><h3><a href="beranda.jsp?hal=tambahbarang">TAMBAH DATA</a></h3></td>
                </tr>
        </table>
                <%kon.close();%>
    </body>
</html>
