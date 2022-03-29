package spring.filehandling;

import java.io.FileNotFoundException;

public class UserDriver {
    public static void main(String[] args) throws FileNotFoundException {
        UserDataReader user = new UserDataReader();
        UserBean myBean = user.getData();
        System.out.println(myBean);
    }
}
