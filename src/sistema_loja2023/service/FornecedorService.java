package sistema_loja2023.service;

import java.util.List;
import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.Fornecedor;
import sistema_loja2023.repository.FornecedorRepository;

public class FornecedorService {

    private final FornecedorRepository fornecedorRepository;

    public FornecedorService(FornecedorRepository fornecedorRepository) {
        this.fornecedorRepository = fornecedorRepository;
    }

    public FornecedorService() {
        this.fornecedorRepository = new FornecedorRepository();
    }

    public Integer alterar(Fornecedor fornecedor) throws CustomException {
        return fornecedorRepository.alterar(fornecedor);
    }

    public Integer inserir(Fornecedor fornecedor) throws CustomException {
        return fornecedorRepository.inserir(fornecedor);
    }

    public Fornecedor obter(Integer codigo) throws CustomException {
        return fornecedorRepository.obter(codigo);
    }

    public Integer excluir(Integer codigo) throws CustomException {
        return fornecedorRepository.excluir(codigo);
    }

    public List<Fornecedor> listarTodos() throws CustomException {
        return fornecedorRepository.listarTodos();
    }
}
