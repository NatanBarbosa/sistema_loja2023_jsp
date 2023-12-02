package sistema_loja2023.service;

import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.TipoPagto;
import sistema_loja2023.repository.TipoPagtoRepository;
public class TipoPagtoService {

    private TipoPagtoRepository tipoPagtoRepository;

    public TipoPagtoService() {
        this.tipoPagtoRepository = new TipoPagtoRepository(); 
    }

    public int alterar(TipoPagto tipoPagto) throws CustomException {
        return tipoPagtoRepository.alterar(tipoPagto);
    }

    public int inserir(TipoPagto tipoPagto) throws CustomException {
        return tipoPagtoRepository.inserir(tipoPagto);
    }

    public TipoPagto obter(int codigo) throws CustomException {
        return tipoPagtoRepository.obter(codigo);
    }

    public int excluir(int codigo) throws CustomException {
        return tipoPagtoRepository.excluir(codigo);
    }

    public List<TipoPagto> listarTodos() throws CustomException {
        return tipoPagtoRepository.listarTodos();
    }

}
