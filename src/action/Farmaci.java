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
import java.sql.DriverManager;
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
        Statement stmtidF = null;
        ResultSet rs = null;
        ResultSet rsidF = null;

        FarmaciBean farmaci = (FarmaciBean) form;

        String cod = farmaci.getCodice();
        String name = farmaci.getNome();
        Integer qnt = farmaci.getQuantita();
        Boolean ric = farmaci.isRicetta();
        String pre = farmaci.getPrezzo();


        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        Integer id  =(Integer) session.getAttribute("id");


        stmtidF = cnn.createStatement();
        String sqlidF = "SELECT idFarmacia FROM farmacia, user\n" +
                        "WHERE user.farmacia_idfarmacia = farmacia.idfarmacia\n" +
                        "AND user.farmacia_idfarmacia ='" + id + "';";

        int idFar = 0;

        rsidF = stmtidF.executeQuery(sqlidF);

        while(rsidF.next()){
            idFar = rsidF.getInt("idFarmacia");
        }
        String b = Integer.toString(idFar);


        String sql = "SELECT idfarmaco,farmaci.nome,quantita,farmaci.ricetta,farmaci.prezzo\n" +
                "FROM farmaci, farmacia, farmaci_has_farmacia, user\n" +
                "WHERE user.farmacia_idfarmacia = '" + idFar + "' \n" +
                "AND farmacia.idfarmacia = '" + idFar + "'\n" +
                "AND farmacia.idfarmacia = farmaci_has_farmacia.farmacia_idfarmacia\n" +
                "AND farmaci.idFarmaco = farmaci_has_farmacia.farmaci_idFarmaco\n" +
                "AND user.farmacia_idfarmacia = farmacia.idfarmacia;";


        ArrayList<FarmaciBean> a = new ArrayList<>();

        if (role != "TFO"){

            rs = stmt.executeQuery(sql);

            String codice = null;
            String prodotto = null;
            Integer quantita = null;
            Boolean ricetta = null;
            String prezzo = null;

             while(rs.next()){
                 FarmaciBean view = new FarmaciBean();

                 codice = rs.getString(1);
                 view.codice = codice;

                 prodotto = rs.getString(2);
                 view.nome = prodotto;

                 quantita = rs.getInt(3);
                 view.quantita = quantita;

                 ricetta = rs.getBoolean(4 );
                 view.ricetta = ricetta;

                 prezzo = rs.getString(5);
                 view.prezzo = prezzo;

                 a.add(view);
             }
            request.setAttribute("View",a);
            for (FarmaciBean bb : a ) {
                System.out.println(bb.getNome());
            }

        }
        else{
            System.out.println(role);
           }
        return mapping.findForward("farmaci");
    }
}