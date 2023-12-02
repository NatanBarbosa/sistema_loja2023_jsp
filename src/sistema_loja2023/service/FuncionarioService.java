package sistema_loja2023.service;

import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.Funcionario;
import sistema_loja2023.repository.FuncionarioRepository;

public class FuncionarioService {

    private FuncionarioRepository funcionarioRepository;

    public FuncionarioService() {
        this.funcionarioRepository = new FuncionarioRepository();
    }

    public int alterar(Funcionario funcionario) throws CustomException {
        return funcionarioRepository.alterar(funcionario);
    }

    public int inserir(Funcionario funcionario) throws CustomException {
        return funcionarioRepository.inserir(funcionario);
    }

    public Funcionario obter(int codigo) throws CustomException {
        return funcionarioRepository.obter(codigo);
    }

    public int excluir(int codigo) throws CustomException {
        return funcionarioRepository.excluir(codigo);
    }

    public List<Funcionario> listarTodos() throws CustomException {
        return funcionarioRepository.listarTodos();
    }
}
