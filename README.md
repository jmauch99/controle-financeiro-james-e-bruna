# Clara Finanças — GitHub Pages

Site de controle financeiro em HTML/CSS/JS, com modo de demonstração local e modo de conta online via Supabase.

## Publicação no GitHub Pages

1. Crie um repositório no GitHub (ex.: `clara-financas`).
2. Envie **todos os arquivos desta pasta** para a raiz do repositório.
3. Em **Settings → Pages → Build and deployment**, escolha **Deploy from a branch**, branch **main**, pasta **/(root)** e salve.
4. Acesse `https://SEU-USUARIO.github.io/clara-financas/` após o deploy.

## Ativar login real e sincronização

O GitHub Pages publica somente arquivos estáticos: não oferece banco de dados ou autenticação privada por si só. O modo padrão é uma demonstração com `localStorage`, **sem login**, disponível apenas no mesmo navegador, e não deve ser usado como armazenamento seguro para dados financeiros sensíveis.

1. Crie um projeto no [Supabase](https://supabase.com/).
2. No **SQL Editor**, execute todo o conteúdo de `schema.sql` uma vez.
3. Em **Authentication → Providers**, habilite **Email** (se já não estiver ativo). Escolha se novos cadastros exigem verificação de e-mail.
4. Em **Authentication → URL Configuration**, informe a URL exata do seu GitHub Pages em **Site URL** e, se necessário, em **Redirect URLs**.
5. Em **Project Settings → API / Connect**, copie o Project URL e a chave pública **publishable** (ou `anon`) e preencha `config.js`. **NUNCA** use a chave `service_role` ou outra chave secreta.
6. Envie o `config.js` atualizado ao GitHub. O formulário de login/cadastro será ativado.
7. O Supabase gerencia senhas e sessões; a tabela usa RLS para restringir acesso por usuário.

**Atenção:** URL e chave pública ficam visíveis no código do navegador por design; a segurança depende de RLS estar habilitado e corretamente configurado. Não coloque senhas, tokens privados ou dados de clientes no repositório.

## Regras atuais

- Lançamentos: receitas e despesas, categorias, datas e recorrência mensal.
- Parcelamento: informe o **valor total** da compra e a quantidade de parcelas, cada parcela aparece no mês correspondente; centavos são ajustados na última.
- Faturas: compra realizada antes do fechamento entra na fatura do mês; compras no dia ou após o fechamento vão para a fatura seguinte. O vencimento é exibido no mês seguinte ao da referência da fatura.
- Fluxo de caixa: despesas comuns pelo mês de lançamento; despesas no cartão entram apenas quando a respectiva **fatura é marcada como paga**, no mês de referência da fatura (não no mês do vencimento). Assim evita-se dupla contagem, mas **não** há conciliação com saldo bancário.
- Visão geral: soma de todos os registros lançados e parcelas projetadas. Recorrência mensal é projetada até dez anos. Os valores dos investimentos são manuais.
- Backup JSON: todos os dados do app. CSV: somente lançamentos.
- Importação CSV: separador `;`, codificação UTF-8, cabeçalho fixo. As datas são `AAAA-MM-DD`; nomes dos cartões precisam ter sido cadastrados antes da importação. Recorrência aceita `monthly`/`none`.
- A versão é um MVP pessoal: não oferece integração com bancos, notificação automática, conciliação, múltiplas moedas, edição individual de parcelas, nem proteção contra conflitos de edição simultânea de vários dispositivos. Use backup regularmente.

## Teste local

Abra `index.html` em um navegador (ou use um servidor local, como `python -m http.server 8000`). Para testar login Supabase, use HTTP/HTTPS com origem configurada no provedor.
