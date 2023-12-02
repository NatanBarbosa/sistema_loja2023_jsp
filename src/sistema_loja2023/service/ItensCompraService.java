package sistema_loja2023.service;

import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.ItensCompra;
import sistema_loja2023.repository.ItensCompraRepository;
public class ItensCompraService {

    private ItensCompraRepository itensCompraRepository;

    public ItensCompraService() {
        this.itensCompraRepository = new ItensCompraRepository(); 
    }

    public int alterar(ItensCompra compra) throws CustomException {
        return itensCompraRepository.alterar(compra);
    }

    public int inserir(ItensCompra compra) throws CustomException {
        return itensCompraRepository.inserir(compra);
    }

    public ItensCompra obter(int codigo) throws CustomException {
        return itensCompraRepository.obter(codigo);
    }

    public int excluir(int codigo) throws CustomException {
        return itensCompraRepository.excluir(codigo);
    }

    public List<ItensCompra> listarTodos() throws CustomException {
        return itensCompraRepository.listarTodos();
    }

}
