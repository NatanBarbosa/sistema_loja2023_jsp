package sistema_loja2023.service;

import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.Compra;
import sistema_loja2023.repository.CompraRepository;
public class CompraService {

    private CompraRepository compraRepository;

    public CompraService() {
        this.compraRepository = new CompraRepository(); 
    }

    public int alterar(Compra compra) throws CustomException {
        return compraRepository.alterar(compra);
    }

    public int inserir(Compra compra) throws CustomException {
        return compraRepository.inserir(compra);
    }

    public Compra obter(int codigo) throws CustomException {
        return compraRepository.obter(codigo);
    }

    public int excluir(int codigo) throws CustomException {
        return compraRepository.excluir(codigo);
    }

    public List<Compra> listarTodos() throws CustomException {
        return compraRepository.listarTodos();
    }

}
