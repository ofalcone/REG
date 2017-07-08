package action;



import bean.FarmaciBean;
import bean.GardiniBean;
import bean.MessaggiBean;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.geom.Point2D;

/**
 * Created by Orlando on 07/07/2017.
 */
public class Messaggi extends Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        MessaggiBean messaggi = new MessaggiBean();

        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");

        messaggi.setMittente(user);
        GardiniBean bean = new GardiniBean();

        request.setAttribute("mx", user);


        return mapping.findForward("messaggi");
    }
}
