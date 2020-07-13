<%@page import="java.sql.ResultSet"%>
<%@page import="control.koneksi"%>
<%@page import="modal.barang"%>
<%@page import="modal.supplier"%>
<%@page import="modal.pesanan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        pesanan pemesanan = new pesanan();
        barang barang = new barang();
        supplier supplier = new supplier();
        koneksi kon = new koneksi();
        ResultSet rs = null;
        ResultSet qrybarang = null;
        ResultSet qrypemesanan = null;
%>
<script type="text/javascript">
    function showEmp(emp_value)
    {
      if (document.getElementById("emp_id").value != "-1")
        {
            xmlHttp = GetXmlHttpObject()
            if (xmlHttp == null)
            {
                alert("Browser does not support HTTP Request")
                return
            }
        var url = "getbarang.jsp"
        url = url + "?emp_id=" + emp_value
        xmlHttp.onreadystatechange = stateChanged
        xmlHttp.open("GET", url, true)
        xmlHttp.send(null)
    } else
    
        {
alert("Pilih Kode Barang");
}
}
function stateChanged()
{
document.getElementById("ename").value = "";
document.getElementById("emp_id").value = "";
if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
{
var showdata = xmlHttp.responseText;
var strar = showdata.split(":");
if (strar.length == 1)
{
document.getElementById("emp_id").focus();
26
alert("Pilih Kode Barang");
document.getElementById("ename").value = " ";
document.getElementById("emp_id").value = " ";
} else if (strar.length > 1)
{
document.getElementById("ename").value = strar[1];
}
}
}
function GetXmlHttpObject()
{
var xmlHttp = null;
try
{
xmlHttp = new XMLHttpRequest();
} catch (e)
{
try
{
xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e)
{
xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
}
}
return xmlHttp;
}
</script>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Transaksi Pemesanan</title>
</head>

<body>
    <h1>Transaksi Pemesanan Barang</h1></br>
    <form action="ServletPemesanan" method="post">
<pre>
        No Pesan <%
        try {
                Class.forName("com.mysql.jdbc.Driver");
                ResultSet nopesan = null;
                nopesan = kon.stmt.executeQuery("select max(right(no_pesan,6)) as no FROM pemesanan");
                while (nopesan.next()) {
                    if (nopesan.first() == false) {
                    out.println("<input type='text' class='form-control' id='inputpesan' readonly value='PS000001' name='no_pesan'>");
                    } else {
                    nopesan.last();
                    int autopesan = nopesan.getInt(1) + 1;
                    String nomorpesan = String.valueOf(autopesan);

                    int noLong = nomorpesan.length();
                    for (int a = 1; a < 7 - noLong; a++) {
                    nomorpesan = "0" + nomorpesan;
                    }
                    String nomerpesan = "PS" + nomorpesan;
                    out.println("<input type='text' class='form-control' id='inputpesan' readonly value='" + nomerpesan + "' name='no_pesan'>");
                    }
                }
        } catch (Exception e) {
        out.println(e);
        }
            %>
            Tanggal pesan <input type="date" name="tanggal"></br>
            Supplier <select name="supplier">
            <%
                
                rs = kon.stmt.executeQuery("SELECT * from supplier ");
                while (rs.next()) {
                supplier.setKd_supp(rs.getString("kd_supp"));
                supplier.setNm_supp(rs.getString("nm_supp"));
            %>
    
        <option value="<%=supplier.getKd_supp()%>"><%=supplier.getNm_supp()%></option>
        <% } %>

            </select><br>

            Barang <select name="semp_id" onchange="showEmp(this.value);">
            <option value="-1">Select</option>

            <%
                rs = kon.stmt.executeQuery("SELECT * from barang ");
                while (rs.next()) {
                barang.setKodebarang(rs.getString("kd_brg"));
                barang.setNamabarang(rs.getString("nm_brg"));
            %>

            <option value="<%=barang.getKodebarang()%>"><%=barang.getKodebarang()%> || <%=barang.getNamabarang()%></option>

            <% } %>

            </select>

            <input type="hidden" name="emp_id" id="emp_id" value="">
                Harga Barang <input type="text" name="emp_name" id="ename" value="" readonly="readonly" onkeyup="sum();"></br>
                Jumlah Pesan <input type="text" name="jml" id="jml" onkeyup="sum();"></br>
                Subtotal <input type="text" name="sub" id="subtotal" readonly="readonly"></br>

<script>
        function sum() {
        var txtFirstNumberValue = document.getElementById('ename').value;
        var txtSecondNumberValue = document.getElementById('jml').value;
        var result = parseFloat(txtFirstNumberValue) * parseFloat(txtSecondNumberValue);
        if (!isNaN(result)) {
        document.getElementById('subtotal').value = result;

        }

    }

</script>

<input type="submit" value="Tambah" name="aksi"></br>
    <table width="500" height="150" border="0" align="center">
        <tr align="center">
            <td colspan="3"><h3>Data Barang Untuk Dipesan</h3></td>
        </tr>
        <tr>
            <th>Nomor Transaksi</th>
            <th>Kode Barang</th>
            <th>Quantity</th>
            <th>Subtotal</th>
            <th>AKSI</th>
        </tr>
    <%!
        int subqty = 0, sub = 0;
    %>

    <%
        rs = kon.stmt.executeQuery("SELECT * from sementara");
        while (rs.next()) {
        out.println("<tr class=isi>"
        + "<td>" + rs.getString(1) + "</td>"
        + "<td>" + rs.getString(2) + "</td>"
        + "<td>" + rs.getString(3) + "</td>"
        + "<td>" + rs.getString(4) + "</td>"
        + "<td><a href=ServletPemesanan?aksi=Delete&kode=" + rs.getString(2) + ">Hapus</a></td>"
        + "</tr>");
        subqty = subqty + (Integer.parseInt(rs.getString(3)));
        sub = sub + (Integer.parseInt(rs.getString(4)));
        out.println("<tr>"
        + "<td colspan='2'>" + "Total" + "</td>"
        + "<td>" + subqty + "</td>"
        + "<td>" + sub + "</td>"
        + "</tr>");
        }
    %>

Total Jumlah Barang Dipesan <input type="text" readonly="readonly" name="totjum" size="1"><br>
      </table>
        <%kon.close();%>
            <input type="submit" value="Simpan" name="aksi"> <input type="reset" value="cancel">
</pre>
</form>
</body>
</html>