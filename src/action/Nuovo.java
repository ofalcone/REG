package action;

import bean.MessaggiBean;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;

/**
 * Created by Orlando on 12/07/2017.
 */
public class Nuovo extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Connection cnn = null;
        Statement stmt = null;
        ResultSet rs = null;
        cnn = ConnectionManager.getConnection();


        String destinatario = null;
        String testo = null;
        String oggetto = null;

        HttpSession session = request.getSession();
        String mittente = (String) session.getAttribute("user");

        MessaggiBean nuovo = (MessaggiBean) form;

            destinatario = nuovo.getDestinatario();
            oggetto = nuovo.getOggetto();
            testo = nuovo.getTesto();



        nuovo.setTesto(testo);
        nuovo.setOggetto(oggetto);
        //messaggi.setDestinatario(destinatario);
        nuovo.setMittente(mittente);


        if(destinatario != null) {

            /*String sql = "INSERT INTO `mydb`.`messaggio` (`oggetto`, `testo`, `FKmittente`,`FKdestinatario`, `data`) " +
                         "VALUES ('" + oggetto + "','" + testo + "','" + mittente + "','" + destinatario + "',NOW() );\n";*/
            CallableStatement statement = cnn.prepareCall("{call nuovo(?,?,?,?)}");

            statement.setString(1, oggetto);
            statement.setString(2, testo);
            statement.setString(3, mittente);
            statement.setString(4, destinatario);

            statement.execute();
            statement.close();
        }

        return mapping.findForward("nuovo");
    }
}