package sistema_loja2023.service;

import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.Produto;
import sistema_loja2023.repository.ProdutoRepository;
public class ProdutoService {

    private ProdutoRepository produtoRepository;

    public ProdutoService() {
        this.produtoRepository = new ProdutoRepository(); 
    }

    public int alterar(Produto produto) throws CustomException {
        return produtoRepository.alterar(produto);
    }

    public int inserir(Produto produto) throws CustomException {
        return produtoRepository.inserir(produto);
    }

    public Produto obter(int codigo) throws CustomException {
        return produtoRepository.obter(codigo);
    }

    public int excluir(int codigo) throws CustomException {
        return produtoRepository.excluir(codigo);
    }

    public List<Produto> listarTodos() throws CustomException {
        return produtoRepository.listarTodos();
    }

}
