import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Day02_5 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        // System.out.println("=============== 2. Yontem ==============");
        // 2.YONTEM (addBatch ve executeBatch() metotlari ile)
        // ----------------------------------------------------
        // addBatch metodu ile SQL ifadeleri gruplandirilabilir ve executeBatch()
        // metodu ile veritabanina bir kere gonderilebilir.
        // executeBatch() metodu bir int [] dizi dondurur. Bu dizi her bir ifade sonucunda
        // etkilenen satir sayisini gosterir.
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys?serverTimezone=UTC", "root", "1234");
        Statement st = con.createStatement();

        /*======================================================================
		  ORNEK1: ogrenciler tablosunu siliniz.
 	    ========================================================================*/
        String [] queries2 = {"INSERT INTO isciler VALUES(10, 'TEKNIK', 3000)",
                "INSERT INTO isciler VALUES(20, 'KANTIN', 2000)",
                "INSERT INTO isciler VALUES(30, 'ARGE', 5000)"};
        for (String each:queries2
             ) {
            st.addBatch(each);
        }
        System.out.println(st.executeBatch());


        con.close();
        st.close();
    }
}
