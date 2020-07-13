<%@page import="control.koneksi"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pembelian || Halaman Admin</title>
    </head>
    <body>
        <form method="POST" action="barangServlet">
            <h2>Tambah Data Barang</h2>
            <table>
                <tr><div class="form-group">
                    <td><label for="inputEmail3" class="col-sm-2 control-lable">ID Barang</label></td>
                    <div class="col-sm-10">
                        <td>
                    <%
                               try {
                                    ResultSet rs = null;
                                    koneksi kon = new koneksi();
                                    rs = kon.stmt.executeQuery("select max(right(kd_brg,4)) as no FROM db_barang");
                                    while (rs.next()){
                                        if(rs.first()== false){
                                            out.println("<input type='text' class='form-control' id='inputEmail3' readyonly value='HP001' name='idbarang'>");
                                        }else {
                                            rs.last();
                                            int autonokm = rs.getInt(1)+1;
                                            String nomorkm = String.valueOf(autonokm);
                                            int noLong = nomorkm.length();
                                            for (int a=1; a<5-noLong; a++){
                                                nomorkm="0" + nomorkm;
                                            }
                                            String nomerkm = "HP"+nomorkm;
                                            out.println("<input type='text' class='form-control' id='inputEmail3' readyonly value='" + nomerkm + "'name='kodebarang'>");
                                        }
                                    }
                                } catch (Exception e){
                                    out.println(e);
                                }
                    %></td>
                    </div>
                </div>
            </tr>
            
            </table>
        </form>
    </body>
</html>
