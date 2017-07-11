package action;



import bean.MessaggiBean;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;

/**
 * Created by Orlando on 07/07/2017.
 */
public class Messaggi extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {


        String destinatario = null;


        String url = "jdbc:mysql://localhost:3306/mydb";
        String driverName = "com.mysql.jdbc.Driver";
        String userDB = "root";
        String passwordDB = "ghiaccio";
        java.sql.Connection cnn = null;

        ResultSet rs = null;
        Statement stmt = null;

        MessaggiBean messaggi = (MessaggiBean) form;


        HttpSession session = request.getSession();

        String user = (String) session.getAttribute("user");

        destinatario = messaggi.getDestinatario();
        if(destinatario != null) {


            String oggetto = messaggi.getOggetto();
            String testo = messaggi.getTesto();

            Calendar currenttime = Calendar.getInstance();
            Date datainvio = new Date((currenttime.getTimeInMillis()));

            messaggi.setTesto(testo);
            messaggi.setOggetto(oggetto);
            messaggi.setDestinatario(destinatario);


            messaggi.setMittente(user);

            String sql = "INSERT INTO `mydb`.`messaggio` (`oggetto`, `testo`, `FKmittente`, `data`) " +
                    "VALUES ('" + oggetto + "','" + testo + "', '1','" + testo + "','" + datainvio + "' );\n";

            try {
                Class.forName(driverName);
                cnn = DriverManager.getConnection(url, userDB, passwordDB);
                stmt = cnn.createStatement();
                stmt.executeUpdate(sql);
            } catch (ClassNotFoundException ex) {
                System.out.println("Driver not found");
            }
            return mapping.findForward("inviati");
        }



        return mapping.findForward("messaggi");

    }
}
