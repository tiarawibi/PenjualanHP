package modal;

public class barang {
    
    private String kodebarang;
    private String namabarang;
    private double harga;
    private double stock;
    
    public String getKodebarang(){
        return kodebarang;
    }
    
    public void setKodebarang (String kodebarang){
        this.kodebarang = kodebarang;
    }
    public String getNamabarang(){
        return namabarang;
    }
    
    public void setNamabarang (String namabarang){
        this.namabarang = namabarang;
    }
    
    public double getHarga(){
        return harga;
    }
    
    public void setHarga (double harga){
        this.harga = harga;
    }
    
    public double getStock(){
        return stock;
    }
    
    public void setStock (double stock){
        this.stock = stock;
    }
}

  