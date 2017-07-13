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

        Date datainvio = null;
        Connection cnn = null;
        Statement stmt = null;
        ResultSet rs = null;

        String destinatario = null;
        String testo = null;
        String oggetto = null;

        cnn = ConnectionManager.getConnection();
        MessaggiBean messaggi = (MessaggiBean) form;
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");
        String uri = request.getRequestURI();

        String sql1 = null;

        sql1 = "";


        stmt = cnn.createStatement();

        rs = stmt.executeQuery(sql1);


        ArrayList<MessaggiBean> arrayResult = new ArrayList<>();

        while (rs.next()) {
            MessaggiBean view = new MessaggiBean();

            destinatario = rs.getString(1);
            view.destinatario = destinatario;

            testo = rs.getString(2);
            view.testo = testo;

            datainvio = rs.getDate(3);
            view.datainvio = datainvio;


            arrayResult.add(view);

        }
        request.setAttribute("View", arrayResult);
        return mapping.findForward("ricevuti");

    }


}
