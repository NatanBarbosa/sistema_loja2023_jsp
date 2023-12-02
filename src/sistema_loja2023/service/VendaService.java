package sistema_loja2023.service;

import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.Venda;
import sistema_loja2023.repository.VendaRepository;
public class VendaService {

    private VendaRepository vendaRepository;

    public VendaService() {
        this.vendaRepository = new VendaRepository(); 
    }

    public int alterar(Venda venda) throws CustomException {
        return vendaRepository.alterar(venda);
    }

    public int inserir(Venda venda) throws CustomException {
        return vendaRepository.inserir(venda);
    }

    public Venda obter(int codigo) throws CustomException {
        return vendaRepository.obter(codigo);
    }

    public int excluir(int codigo) throws CustomException {
        return vendaRepository.excluir(codigo);
    }

    public List<Venda> listarTodos() throws CustomException {
        return vendaRepository.listarTodos();
    }

}
