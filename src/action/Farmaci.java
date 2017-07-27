package action;
import bean.FarmaciBean;
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
import java.util.ArrayList;

/**
 * Created by Orlando on 05/06/2017.
 */
public class Farmaci extends Action{
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Connection cnn = null;
        Statement stmt = null;
        ResultSet rs = null;
        cnn = ConnectionManager.getConnection();

        FarmaciBean farmaci = (FarmaciBean) form;

        String nome = "";
        Boolean ricetta;
        Float prezzo;
        Integer qnt = 0;


        HttpSession session = request.getSession();

        String role = (String) session.getAttribute("role");
        Integer id  =(Integer) session.getAttribute("id");
        Integer idFar = (Integer) session.getAttribute("idfarmacia");


        String sql = "SELECT farmaco.nome,prezzo,qnt,ricetta FROM farmacia, magazzino, farmaco\n" +
                "WHERE idfarmacia = '" + idFar + "' AND idfarmacia=magazzino.FKFArmacia AND FKFArmaco=idFarmaco ;";

        stmt = cnn.createStatement();
        rs = stmt.executeQuery(sql);

        ArrayList<FarmaciBean> a = new ArrayList<>();

             while(rs.next()){
                 FarmaciBean view = new FarmaciBean();

                 view.nome = rs.getString(1);
                 view.prezzo = rs.getString(2);
                 view.quantita = rs.getInt(3);
                 view.ricetta = rs.getBoolean(4);

                 a.add(view);
             }
            request.setAttribute("View",a);

        return mapping.findForward("farmaci");
    }
}