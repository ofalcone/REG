package action;
import bean.MessaggiBean;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
/**
 * Created by Orlando on 07/07/2017.
 */
public class Ricevuti extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Integer idmessaggio = 0;
        Integer idmittente = 0;
        String mittente = null;
        String testo = null;
        String oggetto = null;
        Timestamp data = null;

        Connection cnn = null;
        Statement stmt = null;
        ResultSet rs = null;

        cnn = ConnectionManager.getConnection();
        MessaggiBean messaggi = (MessaggiBean) form;

        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");
        Integer iduser = (Integer) session.getAttribute("id");

        String sql = "SELECT  idmessaggio, FKmittente,oggetto, testo, data,email\n" +
                "                FROM user, destinatario, messaggio\n" +
                "WHERE iduser = FKmittente AND FKmittente !='" + iduser + "' AND FKdestinatario = '" + iduser + "' AND idmessaggio = FKmessaggio\n" +
                "                ORDER BY data desc;";

        stmt = cnn.createStatement();
        rs = stmt.executeQuery(sql);


        ArrayList<MessaggiBean> a = new ArrayList<>();

        while (rs.next()) {
            MessaggiBean view = new MessaggiBean();

           idmessaggio = rs.getInt(1);
           view.idmessaggio=idmessaggio;

           idmittente = rs.getInt(2);
           view.idmittente=idmittente;

           oggetto = rs.getString(3);
           view.oggetto=oggetto;

           testo = rs.getString(4);
           view.testo=testo;

           data = rs.getTimestamp(5);
           view.datainvio=data;

           mittente = rs.getString(6);
           view.mittente=mittente;

           a.add(view);

        }
        request.setAttribute("View", a);

        return mapping.findForward("ricevuti");

    }

}
