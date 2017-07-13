package action;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by Orlando on 12/07/2017.
 */
public class Inviati extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        //String sql = "";

        con = ConnectionManager.getConnection();
        stmt = con.createStatement();
        //rs = stmt.executeQuery(sql);




        return mapping.findForward("home");
    }
}