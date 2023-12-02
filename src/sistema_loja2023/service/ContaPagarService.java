package sistema_loja2023.service;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.ContaPagar;
import sistema_loja2023.repository.ContaPagarRepository;

import java.util.List;

public class ContaPagarService {

    private final ContaPagarRepository contaPagarRepository;

    public ContaPagarService(ContaPagarRepository contaPagarRepository) {
        this.contaPagarRepository = contaPagarRepository;
    }

    public ContaPagarService() {
        this.contaPagarRepository = new ContaPagarRepository();
    }

    public Integer alterar(ContaPagar contaPagar) throws CustomException {
        return contaPagarRepository.alterar(contaPagar);
    }

    public Integer inserir(ContaPagar contaPagar) throws CustomException {
        return contaPagarRepository.inserir(contaPagar);
    }

    public ContaPagar obter(Integer codigo) throws CustomException {
        return contaPagarRepository.obter(codigo);
    }

    public Integer excluir(Integer codigo) throws CustomException {
        return contaPagarRepository.excluir(codigo);
    }

    public List<ContaPagar> listarTodos() throws CustomException {
        return contaPagarRepository.listarTodos();
    }
}
