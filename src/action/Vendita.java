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

        VenditaBean vendita = (VenditaBean) form;

        String elencoprodotti[] = request.getParameterValues("elencoprodotti[]");
        elencoprodotti.toString();
        String nomeProdottoVenduto = "";
        String qntVendute = "";

        String a [] = {"\n"};
        String b = "";


        for(int i = 0; i < elencoprodotti.length; i++){
            a[i]  = String.valueOf((elencoprodotti[i].split(";")));

        }
    System.out.println((a.toString()));



        return mapping.findForward("carrello");
    }
}

