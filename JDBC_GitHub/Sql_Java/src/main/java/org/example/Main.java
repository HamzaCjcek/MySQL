package org.example;

import java.sql.*;

public class Main {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/sys?serverTimezone=UTC", "root", "1234");
        Statement st= conn.createStatement();
        String createQuery="CREATE TABLE isciler\n" +
                "        (\n" +
                "        id INT,\n" +
                "        isim VARCHAR(20),\n" +
                "        iletisim_isim VARCHAR(20),\n" +
                "        CONSTRAINT isciler_pk PRIMARY KEY (id, isim)\n" +
                "        );";
        //System.out.println(st.execute(createQuery));
        String[] queries2={"INSERT INTO isciler VALUES(10, 'TEKNIK', 3000)",
                "INSERT INTO isciler VALUES(20, 'KANTIN', 2000)",
                "INSERT INTO isciler VALUES(30, 'ARGE', 5000)"};
        for (int i = 0; i < queries2.length ; i++) {
            //System.out.println(st.executeUpdate(queries2[i]));
        }
        ResultSet rs= st.executeQuery("Select * from isciler");
        conn.createStatement().executeUpdate("update isciler set isim='Technical' where id=10");
        while (rs.next())
        {
            System.out.println("İd :"+ rs.getInt(1));
           System.out.println("İsim :"+ rs.getString(2));
           System.out.println(rs.getString("iletisim_isim"));
        }
       // String dropQuery = "DROP TABLE cocuklar";

       // System.out.println(st.execute(dropQuery));
        conn.close();
        st.close();
    }
}