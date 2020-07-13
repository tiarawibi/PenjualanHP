
package modal;


public class pesanan {
    
    private String nopesan;
    private String tglpesan;
    private Integer total;
    private String kdsupp;
    private String kodebarang;
    private Integer qty;
    private double subtotal;
    
    public String getNopesan(){
        return nopesan;
    }
    
    public void setNopesan (String nopesan){
        this.nopesan = nopesan;
    }
    
    public String getTglpesan(){
        return tglpesan;
    }
    
    public void setTglpesan (String tglpesan){
        this.tglpesan = tglpesan;
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
