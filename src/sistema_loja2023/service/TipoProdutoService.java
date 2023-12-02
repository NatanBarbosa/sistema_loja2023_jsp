package sistema_loja2023.service;

import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.TipoProduto;
import sistema_loja2023.repository.TipoProdutoRepository;
public class TipoProdutoService {

    private TipoProdutoRepository tipoProdutoRepository;

    public TipoProdutoService() {
        this.tipoProdutoRepository = new TipoProdutoRepository(); 
    }

    public int alterar(TipoProduto tipoProduto) throws CustomException {
        return tipoProdutoRepository.alterar(tipoProduto);
    }

    public int inserir(TipoProduto tipoProduto) throws CustomException {
        return tipoProdutoRepository.inserir(tipoProduto);
    }

    public TipoProduto obter(int codigo) throws CustomException {
        return tipoProdutoRepository.obter(codigo);
    }

    public int excluir(int codigo) throws CustomException {
        return tipoProdutoRepository.excluir(codigo);
    }

    public List<TipoProduto> listarTodos() throws CustomException {
        return tipoProdutoRepository.listarTodos();
    }

}
