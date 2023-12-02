<%-- <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <%-- <a class="navbar-brand" href="#">Super Sistema</a> 
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="produtos.jsp">Produtos</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="notafiscal.jsp">Nota Fiscal</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="compras.jsp">Compras</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="vendas.jsp">Vendas</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="itenscompra.jsp">Itens da Compra</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="itensvenda.jsp">Itens da Venda</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="tipoproduto.jsp">Tipos de produto</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="tipopagto.jsp">Tipos de pagamento</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contareceber.jsp">Contas a receber</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contapagar.jsp">Contas a pagar</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="funcionario.jsp">Funcionários</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="fornecedor.jsp">Fornecedores</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="deslogar.jsp">Deslogar</a>
        </li>
      </ul>
    </div>
  </div>
</nav> --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<div class="container-fluid position-fixed left-bar">
    <div class="row flex-nowrap">
        <div class="col-12 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="index.jsp" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">Menu</span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item">
                        <a href="index.jsp" class="nav-link align-middle px-0">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" data-bs-toggle="collapse" data-bs-target="#submenuFinanceiro" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-cash"></i> <span class="ms-1 d-none d-sm-inline">Financeiro</span> 
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenuFinanceiro" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="notafiscal.jsp" class="nav-link px-0">Nota Fiscal</a>
                            </li>
                            <li>
                                <a href="compras.jsp" class="nav-link px-0">Compras</a>
                            </li>
                            <li>
                                <a href="vendas.jsp" class="nav-link px-0">Vendas</a>
                            </li>
                            <li>
                                <a href="contareceber.jsp" class="nav-link px-0">Contas a Receber</a>
                            </li>
                            <li>
                                <a href="contapagar.jsp" class="nav-link px-0">Contas a Pagar</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" data-bs-toggle="collapse" data-bs-target="#submenuProdutos" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-box"></i> <span class="ms-1 d-none d-sm-inline">Produtos</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenuProdutos" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="produtos.jsp" class="nav-link px-0">Produtos</a>
                            </li>
                            <li>
                                <a href="tipoproduto.jsp" class="nav-link px-0">Tipos de Produto</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" data-bs-toggle="collapse" data-bs-target="#submenuPessoas" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-person"></i> <span class="ms-1 d-none d-sm-inline">Pessoas</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenuPessoas" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="funcionario.jsp" class="nav-link px-0">Funcionários</a>
                            </li>
                            <li>
                                <a href="fornecedor.jsp" class="nav-link px-0">Fornecedores</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" data-bs-toggle="collapse" data-bs-target="#submenuOutros" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-three-dots"></i> <span class="ms-1 d-none d-sm-inline">Outros</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenuOutros" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="itenscompra.jsp" class="nav-link px-0">Itens da Compra</a>
                            </li>
                            <li>
                                <a href="itensvenda.jsp" class="nav-link px-0">Itens da Venda</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <hr>
                <div class="dropdown pb-4">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="./assets/user.png" alt="hugenerd" width="30" height="30" class="rounded-circle">
                        <span class="d-none d-sm-inline mx-1">Douglas</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                        <li><a class="dropdown-item" href="deslogar.jsp">Sair</a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>
