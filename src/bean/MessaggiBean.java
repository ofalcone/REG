package bean;

import org.apache.struts.action.ActionForm;

import java.sql.Date;
import java.sql.Timestamp;


/**
 * Created by Orlando on 07/07/2017.
 */
public class MessaggiBean extends ActionForm {
    public Timestamp datainvio;



    public Integer getIdmittente() {
        return idmittente;
    }

    public void setIdmittente(Integer idmittente) {
        this.idmittente = idmittente;
    }

    public Integer idmittente;

    public int getIdmessaggio() {
        return idmessaggio;
    }

    public void setIdmessaggio(int idmessaggio) {
        this.idmessaggio = idmessaggio;
    }

    public int idmessaggio;

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

    public String oggetto;


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

    public Timestamp getDatainvio() {
        return datainvio;
    }

    public void setDatainvio(Timestamp datainvio) {
        this.datainvio = datainvio;
    }


    public Integer getIddestinatario() {
        return iddestinatario;
    }

    public void setIddestinatario(Integer iddestinatario) {
        this.iddestinatario = iddestinatario;
    }

    public Integer iddestinatario;


}
