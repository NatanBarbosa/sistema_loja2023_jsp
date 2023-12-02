package sistema_loja2023.service;

import java.util.List;
import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.NotaFiscal;
import sistema_loja2023.repository.NotaFiscalRepository;

public class NotaFiscalService {

    private final NotaFiscalRepository notaFiscalRepository;

    public NotaFiscalService(NotaFiscalRepository notaFiscalRepository) {
        this.notaFiscalRepository = notaFiscalRepository;
    }

    public NotaFiscalService() {
        this.notaFiscalRepository = new NotaFiscalRepository();
    }

    public Integer alterar(NotaFiscal notaFiscal) throws CustomException {
        return notaFiscalRepository.alterar(notaFiscal);
    }

    public Integer inserir(NotaFiscal notaFiscal) throws CustomException {
        return notaFiscalRepository.inserir(notaFiscal);
    }

    public NotaFiscal obter(Integer codigo) throws CustomException {
        return notaFiscalRepository.obter(codigo);
    }

    public Integer excluir(Integer codigo) throws CustomException {
        return notaFiscalRepository.excluir(codigo);
    }

    public List<NotaFiscal> listarTodos() throws CustomException {
        return notaFiscalRepository.listarTodos();
    }
}
