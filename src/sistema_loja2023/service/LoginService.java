package sistema_loja2023.service;

public class LoginService {
 
    public static boolean validarLogin(String usuario, String senha) {
        return usuario.equals("admin") && senha.equals("123"); 

    }

}