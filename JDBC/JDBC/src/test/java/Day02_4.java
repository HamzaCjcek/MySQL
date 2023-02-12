import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Day02_4 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        /*
        CREATE TABLE firmalar
        (
        id INT,
        isim VARCHAR(20),
        iletisim_isim VARCHAR(20),
        CONSTRAINT firmalar_pk PRIMARY KEY (id, isim)
        );
​
        INSERT INTO firmalar VALUES
        (1, 'ACB', 'Ali Can'),
        (2, 'RDB', 'Veli Gul'),
        (3, 'KMN', 'Ayse Gulmez');
         */
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys?serverTimezone=UTC", "root", "1234");
        Statement st = con.createStatement();

        /*======================================================================
		  ORNEK1: ogrenciler tablosunu siliniz.
 	    ========================================================================*/

        String createQuery = "CREATE TABLE isciler\n" +
                "        (\n" +
                "        id INT,\n" +
                "        isim VARCHAR(20),\n" +
                "        iletisim_isim VARCHAR(20),\n" +
                "        CONSTRAINT isciler_pk PRIMARY KEY (id, isim)\n" +
                "        );";

       // System.out.println(st.execute(createQuery));

        String[] UpdateQuery = {"insert into isciler values(90,'Arge','Hamza')","insert into isciler values(90,'Orge','Salih')"};
        for (int i = 0; i <UpdateQuery.length ; i++) {
            System.out.println(st.executeUpdate(UpdateQuery[i]));
        }

        con.close();
        st.close();
    }

}
