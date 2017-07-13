package bean;

import org.apache.struts.action.ActionForm;

import java.sql.Date;

/**
 * Created by Orlando on 07/07/2017.
 */
public class MessaggiBean extends ActionForm {



    public String getMittente() {
        return mittente;
    }

    public void setMittente(String mittente) {
        this.mittente = mittente;
    }

    public String mittente;

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public String destinatario;


    public String getOggetto() {
        return oggetto;
    }

    public void setOggetto(String oggetto) {
        this.oggetto = oggetto;
    }

    private String oggetto;


    public String getTesto() {
        return testo;
    }

    public void setTesto(String testo) {
        this.testo = testo;
    }

    public String testo;

    public String testoDB;

    public String getTestoDB() {
        return testoDB;
    }

    public void setTestoDB(String testoDB) {
        this.testoDB = testoDB;
    }

    public Date getDatainvio() {
        return datainvio;
    }

    public void setDatainvio(Date datainvio) {
        this.datainvio = datainvio;
    }

    public Date datainvio;
}
