package action;

import bean.MessaggiBean;
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


        MessaggiBean messaggi = (MessaggiBean) form;
        String mittente = (String) session.getAttribute("user");




            destinatario = messaggi.getDestinatario();
            oggetto = messaggi.getOggetto();
            testo = messaggi.getTesto();

            Calendar currenttime = Calendar.getInstance();
            // Date datainvio = new Date((currenttime.getTimeInMillis()));


            messaggi.setTesto(testo);
            messaggi.setOggetto(oggetto);
            //messaggi.setDestinatario(destinatario);
            messaggi.setMittente(mittente);

            String sql = "INSERT INTO `mydb`.`messaggio` (`oggetto`, `testo`, `FKmittente`, `data`) " +
                    "VALUES ('" + oggetto + "','" + testo + "', '1','" + testo + "',NOW() );\n";
            stmt = cnn.createStatement();
            stmt.executeUpdate(sql);





        return mapping.findForward("messaggi");
    }
}