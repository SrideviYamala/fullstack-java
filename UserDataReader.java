package spring.filehandling;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Scanner;

public class UserDataReader {
    public UserBean getData() throws FileNotFoundException {
        FileReader reader = new FileReader("C:/Users/JAWAHAR/wiley/JDBC/src/spring/filehandling/user_data.xml");
        Scanner sc = new Scanner(reader);
        UserBean myBean = new UserBean();
        String s;
        while ((s = sc.nextLine()) != null) {
            if (s.trim().equals("<first_name>")) {
                myBean.setFirst_name(sc.nextLine().trim());
                break;
            }
        }
        while ((s = sc.nextLine()) != null) {
            if (s.trim().equals("<last_name>")) {
                myBean.setLast_name(sc.nextLine().trim());
                break;
            }
        }
        sc.close();
        return myBean;
    }
}
