package sistema_loja2023.service;

import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.ItensVenda;
import sistema_loja2023.repository.ItensVendaRepository;
public class ItensVendaService {

    private ItensVendaRepository itensVendaRepository;

    public ItensVendaService() {
        this.itensVendaRepository = new ItensVendaRepository(); 
    }

    public int alterar(ItensVenda itemVenda) throws CustomException {
        return itensVendaRepository.alterar(itemVenda);
    }

    public int inserir(ItensVenda itemVenda) throws CustomException {
        return itensVendaRepository.inserir(itemVenda);
    }

    public ItensVenda obter(int codigo) throws CustomException {
        return itensVendaRepository.obter(codigo);
    }

    public int excluir(int codigo) throws CustomException {
        return itensVendaRepository.excluir(codigo);
    }

    public List<ItensVenda> listarTodos() throws CustomException {
        return itensVendaRepository.listarTodos();
    }

}
