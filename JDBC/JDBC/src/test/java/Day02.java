import java.sql.*;

public class Day02 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        /*=======================================================================
         ORNEK1: Id'si 1'den buyuk firmalarin ismini ve iletisim_isim'ini isim
         ters sirali yazdirin.
        ========================================================================*/
        /*
        CREATE TABLE firmalar
        (
        id INT,
        isim VARCHAR(20),
        iletisim_isim VARCHAR(20),
        CONSTRAINT firmalar_pk PRIMARY KEY (id, isim)
        );

        INSERT INTO firmalar VALUES
        (1, 'ACB', 'Ali Can'),
        (2, 'RDB', 'Veli Gul'),
        (3, 'KMN', 'Ayse Gulmez');
         */

       Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/sys?serverTimezone=UTC", "root", "1234");
        Statement st=conn.createStatement();
        ResultSet rs=st.executeQuery("Select isim,iletisim_isim from firmalar where id>1 order by isim desc");
        while(rs.next())
        {
            System.out.println("İsim :" + rs.getString("isim"));
            System.out.println("İletisim İsmi:" + rs.getString("iletisim_isim"));

        }
        System.out.println("---------------------------Örnek 2 -----------------------------");
        ResultSet rs2=st.executeQuery("select id, isim from firmalar where iletisim_isim like '%li%' order by id");
        while (rs2.next())
        {
            System.out.println("İd : " + rs2.getInt("id"));
            System.out.println("İsim : " + rs2.getString("isim"));
        }
        st.close();
        rs.close();
        conn.close();
    }
}
