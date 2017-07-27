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
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 * Created by Orlando on 12/07/2017.
 */
public class Inviati extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

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

        String sql = "SELECT  idmessaggio, FKmittente,oggetto, testo, data,FKdestinatario,email FROM user, destinatario, messaggio\n" +
                "WHERE iduser = FKdestinatario AND FKmittente = '" + iduser + "' AND FKdestinatario != '" + iduser + "' AND idmessaggio = FKmessaggio\n" +
                "                ORDER BY data desc;";

        stmt = cnn.createStatement();
        rs = stmt.executeQuery(sql);


        ArrayList<MessaggiBean> a = new ArrayList<>();

        while (rs.next()) {
            MessaggiBean view = new MessaggiBean();

            view.idmessaggio = rs.getInt(1);
            //view.idmittente = rs.getInt(2);
            view.oggetto = rs.getString(3);
            view.testo = rs.getString(4);
            view.datainvio = rs.getTimestamp(5);
            view.iddestinatario = rs.getInt(6);
            view.mittente = rs.getString(7);
            a.add(view);

        }
        request.setAttribute("View", a);

        return mapping.findForward("inviati");

    }

}