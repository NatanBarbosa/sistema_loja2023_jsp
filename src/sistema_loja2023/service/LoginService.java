package sistema_loja2023.service;

public class LoginService {
    private static boolean logado = false;

    public static boolean validarLogin(String usuario, String senha) {
        if(usuario.equals("admin") && senha.equals("123")) {
            LoginService.logado = true;
        }  

        return LoginService.estaLogado();
    }

    public static void deslogar() {
        LoginService.logado = false;
    }

    public static boolean estaLogado () {
       return LoginService.logado;
    }
}