package bean;

import org.apache.struts.action.ActionForm;

/**
 * Created by Orlando on 27/07/2017.
 */
public class CreaFarmaciaBean extends ActionForm {
    public Integer id;
    public String nome;
    public String indirizzo;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String password;

    public String getNomeTF() {
        return nomeTF;
    }

    public void setNomeTF(String nomeTF) {
        this.nomeTF = nomeTF;
    }

    public String getEmailTF() {
        return emailTF;
    }

    public void setEmailTF(String emailTF) {
        this.emailTF = emailTF;
    }

    public String getCognomeTF() {
        return cognomeTF;
    }

    public void setCognomeTF(String cognomeTF) {
        this.cognomeTF = cognomeTF;
    }

    public String nomeTF;
    public String emailTF;
    public String cognomeTF;



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String telefono;
}
