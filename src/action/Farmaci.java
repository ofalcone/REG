package action;

import bean.FarmaciBean;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

        String sql="SELECT * FROM mydb.farmaci;";
        //String sqlR= "SELECT * FROM mydb.ricette;";
        //String sqlB = "SELECT * FROM mydb.banco;";

        Statement stmt = null;
        Statement stmtR = null;
        Statement stmtB = null;

        ResultSet rs = null;
        ResultSet rsR = null;
        ResultSet rsB = null;

        String url = "jdbc:mysql://localhost:3306/mydb";
        String driverName = "com.mysql.jdbc.Driver";
        String userDB = "root";
        String passwordDB = "ghiaccio";
        java.sql.Connection cnn;

        //INSERT
        FarmaciBean farmaci = (FarmaciBean) form;

        String cod = farmaci.getCodice();
        String name = farmaci.getNome();
        Integer qnt = farmaci.getQuantita();
        Boolean ric = farmaci.isRicetta();
        String pre = farmaci.getPrezzo();


        try {
            Class.forName(driverName);
            cnn  = DriverManager.getConnection(url,userDB,passwordDB);
            stmt = cnn.createStatement();
            stmtR = cnn.createStatement();
            stmtB = cnn.createStatement();
        }
        catch (ClassNotFoundException ex) {
            System.out.println("Driver not found");
        }

        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");

            ArrayList<FarmaciBean> a = new ArrayList<>();

        if (role != "TFO"){
            System.out.println(role);
             rs = stmt.executeQuery(sql);

             //rsR=stmtR.executeQuery(sqlR);
             //rsB=stmtB.executeQuery(sqlB);
            String codice = null;
            String prodotto = null;
            Integer quantita = null;
            Boolean ricetta = null;
            String prezzo = null;



             while(rs.next()){

                 System.out.println(rs);
                 FarmaciBean view = new FarmaciBean();

                 codice = rs.getString(1);
                 prodotto = rs.getString(2);
                 quantita = rs.getInt(3);
                 ricetta = rs.getBoolean(4 );
                 prezzo = rs.getString(5);

                 view.codice = codice;
                 view.nome = prodotto;
                 view.quantita = quantita;
                 view.ricetta = ricetta;
                 view.prezzo = prezzo;

                 a.add(view);
             }
              //System.out.println(a.toString());
             request.setAttribute("View",a);
        }
        else{
            System.out.println(role);
           }
        return mapping.findForward("farmaci");
    }
}