package action;

import bean.VenditaBean;
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
 * Created by Orlando on 26/07/2017.
 */
public class Vendita extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Connection cnn = null;
        Statement stmt = null;
        Statement stmt2 = null;
        ResultSet rs = null;

        VenditaBean vendita = (VenditaBean) form;

        String cf = vendita.getCf();
        Integer controllo = vendita.getControllo();

        String sql="SELECT COUNT(*) as paziente FROM paziente\n" +
                "WHERE CF='" + cf + "'";


        cnn = ConnectionManager.getConnection();
        stmt = cnn.createStatement();
        rs = stmt.executeQuery(sql);

        HttpSession session = request.getSession();
if(cf == "null") {
    int i = 0;
    while (rs.next()) {
        i = rs.getInt("paziente");
    }

    session.setAttribute("cf", cf);
    controllo = i;
    vendita.setControllo(controllo);
}
        return mapping.findForward("vendita");
    }
}

