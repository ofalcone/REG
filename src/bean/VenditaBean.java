package bean;

import org.apache.struts.action.ActionForm;

import java.sql.Time;
import java.sql.Timestamp;

/**
 * Created by Orlando on 26/07/2017.
 */
public class VenditaBean extends ActionForm {

    public String getCf() {
        return cf;
    }

    public void setCf(String cf) {
        this.cf = cf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Timestamp getNascita() {
        return nascita;
    }

    public void setNascita(Timestamp nascita) {
        this.nascita = nascita;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }


    public Integer getControllo() {
        return controllo;
    }

    public void setControllo(Integer controllo) {
        this.controllo = controllo;
    }
    public String cf;
    public String nome;
    public Timestamp nascita;
    public String cognome;
    public Integer controllo;

    public Integer getQntNuova() {
        return qntNuova;
    }

    public void setQntNuova(Integer qntNuova) {
        this.qntNuova = qntNuova;
    }

    public Integer qntNuova;
}
