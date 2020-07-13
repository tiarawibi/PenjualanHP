
package modal;


public class jurnal {
    
    private String nojurnal,tgljurnal,noakun;
    private Double debet,kredit;
    
    public String getNojurnal(){
        return nojurnal;
    }
    
    public void setNojurnal (String nojurnal){
        this.nojurnal = nojurnal;
    }
    
    public String getTgljurnal(){
        return tgljurnal;
    }
    
    public void setTgljurnal (String tgljurnal){
        this.tgljurnal = tgljurnal;
    }
    
    public String getNoakun(){
        return noakun;
    }
    
    public void setNoakun (String noakun){
        this.noakun = noakun;
    }
    
    public Double getDebet(){
        return debet;
    }
    
    public void setDebet (Double debet){
        this.debet = debet;
    }
    
    public Double getKredit(){
        return kredit;
    }
    
    public void setKredit (Double kredit){
        this.kredit = kredit;
    }
}
