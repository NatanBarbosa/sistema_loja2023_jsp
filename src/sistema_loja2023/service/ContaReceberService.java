package sistema_loja2023.service;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.ContaReceber;
import sistema_loja2023.repository.ContaReceberRepository;

import java.util.List;

public class ContaReceberService {

    private final ContaReceberRepository contaReceberRepository;

    public ContaReceberService(ContaReceberRepository contaReceberRepository) {
        this.contaReceberRepository = contaReceberRepository;
    }

    public ContaReceberService() {
        this.contaReceberRepository = new ContaReceberRepository();
    }

    public Integer alterar(ContaReceber contaReceber) throws CustomException {
        return contaReceberRepository.alterar(contaReceber);
    }

    public Integer inserir(ContaReceber contaReceber) throws CustomException {
        return contaReceberRepository.inserir(contaReceber);
    }

    public ContaReceber obter(Integer codigo) throws CustomException {
        return contaReceberRepository.obter(codigo);
    }

    public Integer excluir(Integer codigo) throws CustomException {
        return contaReceberRepository.excluir(codigo);
    }

    public List<ContaReceber> listarTodos() throws CustomException {
        return contaReceberRepository.listarTodos();
    }
}
