
package modal;


public class pembelian {
    
    private String nobeli;
    private String tglbeli;
    private String nofaktur;
    private Integer totalbeli;
    private String nopesan;
    private String kodebarang;
    private Integer qty;
    private double subtotal;
    
    public String getNobeli(){
        return nobeli;
    }
    
    public void setNobeli (String nobeli){
        this.nobeli = nobeli;
    }
    
    public String getTglbeli(){
        return tglbeli;
    }
    
    public void setTglbeli (String tglbeli){
        this.tglbeli = tglbeli;
    }
    
    public String getNofaktur(){
        return nofaktur;
    }
    
    public void setNofaktur (String nofaktur){
        this.nofaktur = nofaktur;
    }
    
    public Integer getTotalbeli(){
        return totalbeli;
    }
    
    public void setTotalbeli (Integer totalbeli){
        this.totalbeli = totalbeli;
    }
    
    public String getNopesan(){
        return nopesan;
    }
    
    public void setNopesan (String nopesan){
        this.nopesan = nopesan;
    }
    
    public String getKodebarang(){
        return kodebarang;
    }
    
    public void setKodebarang (String kodebarang){
        this.kodebarang = kodebarang;
    }
    
    public Integer getQty(){
        return qty;
    }
    
    public void setQty (Integer qty){
        this.qty = qty;
    }
    
    public Double getSubtotal(){
        return subtotal;
    }
    
    public void setSubtotal (Double subtotal){
        this.subtotal = subtotal;
    }
}
