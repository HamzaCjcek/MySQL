import java.sql.*;

public class Day02_2 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/sys?serverTimezone=UTC", "root", "1234");
        Statement st=conn.createStatement();
        //ResultSet rs=st.executeQuery("Select isim,iletisim_isim from firmalar where id>1 order by isim desc");
        ResultSet rs=st.executeQuery("Select * from firmalar where id=1");
        conn.createStatement().executeUpdate("update firmalar set iletisim_isim='Hamza' where id=1 ");
        while(rs.next())
        {
            System.out.println("İd :" + rs.getInt(1));
            System.out.println("İsmi:" + rs.getString(2));
            System.out.println("İletisim İsmi:" + rs.getString(3));

        }
        conn.close();
        st.close();
        rs.close();
    }
}
