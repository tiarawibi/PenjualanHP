
package control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.barang;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class barangServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()){
            barang barang = new barang ();
            koneksi kon = new koneksi();
            PreparedStatement pstmt = null;
            int result =0;
            
            String aksi = request.getParameter("aksi");
            if (aksi != null){
                barang.setKodebarang(request.getParameter("kodebarang"));
                barang.setNamabarang(request.getParameter("namabarang"));
                barang.setHarga(Double.parseDouble(request.getParameter("harga")));
                barang.setStock(Double.parseDouble(request.getParameter("stok")));
                switch (aksi){
                    case "simpan":
                    pstmt = kon.conn.prepareStatement("INSERT INTO db_barang values('" + barang.getKodebarang()+ "','"
                    + barang.getNamabarang()+"','"
                    + barang.getHarga()+"','"
                    + barang.getStock()+"')");
                    result = pstmt.executeUpdate();
                    if (result > 0){
                        out.println("<script>"
                                    + "alert('Data Telah Ditambahkan');"
                                    + "document.location='beranda.jsp?hal=tampilbarang';"
                                    + "</script>");
                    }
                    break;
                    
                    case "delete":
                     pstmt = kon.conn.prepareStatement("DELET FROM db_barang WHERE kd_brg='"+ barang.getKodebarang()+"'");
                     result=pstmt.executeUpdate();
                     if(result>0){
                         out.println("<script>"
                         + "alert('Data Telah Dihapus');"
                                 +"document.location='beranda.jsp?hal=tampilbarang';"
                                 +"</script>");
                     }
                     break;
                    case "Update":
                        pstmt = kon.conn.prepareStatement("UPDATE db_barang SET nm_brg='"
                        + barang.getNamabarang()+"',harga='"
                        + barang.getHarga()+"',stok='"
                        + barang.getStock()+"'where kd_brg='"
                        + barang.getKodebarang()+"'");
                        
                        result = pstmt.executeUpdate();
                        if (result>0){
                            out.println("<script>"
                            + "alert('Data Telah Diupdate');"
                            + "document.location='beranda.jsp?hal=tampilbarang'"
                            + "</script>");
                        }
                    default:
                        break;
                }         
                }else{
                out.println("<script>"
                + "alert('Gagal Eksekusi');"
                        + "document.location=tampilbarang.jsp"
                        + "</script>");
                
                        
                
                
            }
            
        }
    }
    
    
}
