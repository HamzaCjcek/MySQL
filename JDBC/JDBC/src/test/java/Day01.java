import java.sql.*;

public class Day01 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        // 1 - Ilgili Driver'i yuklemeliyiz. MySQL kullandigimizi bildiriyoruz.
        // Driver'i bulamama ihtimaline karsi forName metodu icin ClassNotFoundException
        // method signature'imiza axception olarak firlatmamizi istiyor.
        Class.forName("com.mysql.cj.jdbc.Driver");
        // 2 - Baglantiyi olusturmak icin username ve password girmeliyiz.
        // Burada da bu username ve password'un yanlis olma ihtimaline karsi
        // SQLException firlatmamizi istiyor.
        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/sys?serverTimezone=UTC", "root", "1234");
        // 3 - SQL query'leri icin bir Statement objesi olusturup , javada SQL
        // sorgularimiz icin bir alan acacagiz.
        Statement st=conn.createStatement();
        ResultSet rs=st.executeQuery("Select * from cucuklar where yazili_notu>75");
        while(rs.next())
        {
            System.out.println("Personel Adi :" + rs.getString("isim"));
            System.out.println("Personel Adi :" + rs.getInt(4));
        }
        st.close();
        rs.close();
        conn.close();
    }
}
