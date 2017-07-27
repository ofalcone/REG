package action;

import bean.CreaFarmaciaBean;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by Orlando on 27/07/2017.
 */
public class CreaFarmacia extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Connection cnn = null;
        Statement stmt = null;
        Statement stmt2 = null;
        Statement stmt3 = null;

        CreaFarmaciaBean crea = (CreaFarmaciaBean) form;
        HttpSession session = request.getSession();


        String nome =crea.getNome();
        String indirizzo = crea.getIndirizzo();
        String telefono = crea.getTelefono();

        String nomeTF= crea.getNomeTF();
        String cognome= crea.getCognomeTF();
        String email = crea.getEmailTF();
        String password = crea.getPassword();

        if(nomeTF != "") {

            String sql = "INSERT INTO farmacia (nome,via,telefono)\n" +
                    "VALUES ('" + nome + "','" + indirizzo + "','" + telefono + "');";

            String sql2 = "INSERT INTO user(email,nome,cognome,ruolo,FKFarmacia)\n" +
                    "VALUES ('" + email + "','" + nomeTF + "','" + cognome + "','TF',LAST_INSERT_ID());";

            String sql3 = "INSERT INTO user_security (email,password)\n"+
                    "VALUES ('" + email + "','" + password+ "');";

            cnn = ConnectionManager.getConnection();
            stmt = cnn.createStatement();
            stmt.executeUpdate(sql);

            stmt2 = cnn.createStatement();
            stmt2.executeUpdate(sql2);

            stmt3 = cnn.createStatement();
            stmt3.executeUpdate(sql3);

        }

        return mapping.findForward("home");
    }
}
