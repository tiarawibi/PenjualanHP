<%@page import="java.sql.ResultSet" %>
<%@page import="control.koneksi" %>
<%@page import="modal.barang" %>
<%@page import="modal.pembelian"%>
<%@page impor
        
        t="modal.pesanan" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    pembelian pembelian=new pembelian();
    pesanan pesanan = new pesanan();
    barang barang = new barang();
    koneksi kon = new koneksi();
    ResultSet rs = null;
    ResultSet qrybarang = null;
    ResultSet qrypesan = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaksi pembelian</title>
    </head>
    <body>
        <h1>Transaksi Pembelian Barang</h1>
        <form method="POST" action="pembelianServlet">
            <pre>
                No Pesanan  <%
                    try {
                        Class.forName("com.mysql.JDBC.Driver");
                        ResultSet nopesan = null;
                        nopesan = kon.stmt.executeQuery("select max (right(no_pesanan,6)) as no FROM db_pesanan");
                        while (nopesan.next()){
                            if (nopesan.first()==false){
                                out.println("<input type='text' class='form-control' id='inputpesan' readyonly value='PB0001' name='no_pesanan'>");
                                
                            }else {
                                nopesan.last();
                                int autopesan = nopesan.getInt(1)+1;
                                String nomorpesan = String.valueOf(autopesan);
                                int noLong = nomorpesan.length();
                                
                                for(int a = 1; a < 4 - noLong; a++) {
                                    nomorpesan= "0" + nomorpesan;
                                }
                                String nomerpesan = "PB" + nomorpesan;
                                out.println("<input type='text' class='form-control' id='input-pesan' readyonly value='"+ nomerpesan +"'name=no_pesan'>");
                                
                            }
                        }
                    }catch (Exception e){
                        out.println();
                    }
                %>
             Tanggal Beli  <input type="date" name="tanggal"></br>
             No Pesan   <select name="nomor">
                 <%
                     qrypesan = kon.stmt.executeQuery("SELECT no_pesanan FROM db_pesanan");
                     while (qrypesan.next()){
                         pesanan.setNopesan(qrypesan.getString("no_pesanan"));
                     
                 %>
                        <option value="<%=pesanan.getNopesan()%>"><%=pesanan.getNopesan()%></option>

                        <%}%>
                    </select></br>
             <input type="submit" value="Tambah" name="aksi"></br>
             <table width="500" height="150" border="0" align="center">
                 <tr align="center">
                     <td colspan="3">Data Barang yang di beli</td></td>
                 </tr>
                 <tr>
                     <th>Nomor Pesanan</th>
                     <th>Kode Barang</th>
                     <th>Quantity</th>
                     <th>Subtotal</th>
                     <th>AKSI</th>
                 </tr>
                 <% //--Koneksi--
                     
                    String nomer = null;
                    String kode = null;
                    String quantity = null;
                    String subtotal = null;
                    rs = kon.stmt.executeQuery("SELECT * FROM sementara ORDER BY nomer asc");
                    
                    while (rs.next()){
                        nomer = rs.getString("nomer");
                        kode = rs.getString(2);
                        quantity = rs.getString(3);
                        subtotal = rs.getString(4);
                    
                 %>
                 <tr>
                     <td><% out.println(nomer);%></td>
                     <td><% out.println(kode);%></td>
                     <td><% out.println(quantity);%></td>
                     <td><% out.println(subtotal);%></td>
                 </tr>
                 <%}%>
                 
</table>
<%kon.close();%>
<input type="submit" value="Simpan" name="aksi"><input type="reset" value="cancel">
            </pre>
        </form>
    </body>
</html>
