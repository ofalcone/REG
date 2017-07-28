package action;

import java.util.Arrays;
import bean.VenditaBean;
import jdk.nashorn.internal.ir.RuntimeNode;
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
import java.util.Set;


import static com.sun.org.apache.xalan.internal.lib.ExsltStrings.split;

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
        ResultSet rs2 = null;

        VenditaBean vendita = (VenditaBean) form;

        String elencoprodotti[] = request.getParameterValues("elencoprodotti[]");
        elencoprodotti.toString();
        /*String nomeProdottoVenduto = "";
        String qntVendute = "";*/
        int j = 0;
        Integer dim = elencoprodotti.length;
            String[] nomi = {""};
            Integer[] quantita = {0};
        String  nomeProdottoVenduto = "";
        Integer qntVendute = 0;

        for(int i=0; i<2; i++){

            String [] a = elencoprodotti[i].split(";");

            nomeProdottoVenduto= a[0];
             qntVendute = Integer.parseInt(a[1]);


        }


        String sql = "SELECT ricetta FROM farmaco\n" +
                "WHERE nome = '" + nomeProdottoVenduto + "';";

        cnn = ConnectionManager.getConnection();
        stmt = cnn.createStatement();
        rs = stmt.executeQuery(sql);

        Integer controllo = 0;
        while (rs.next()) {
            controllo = rs.getInt(1);
        }

        if(controllo == 1){
            return mapping.findForward("controlloutente");
        }





        return mapping.findForward("carrello");
    }
}

