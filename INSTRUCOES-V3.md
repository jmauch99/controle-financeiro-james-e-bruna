# Atualização V3 — Controle Financeiro James e Bruna

## Commit
Substitua somente `index.html`, `style.css`, `app.js` no repositório (branch main). Preserve o `config.js` atual.
Mensagem: `feat: separar despesas, gráficos de gastos e histórico de investimentos por caixa`

## Supabase
**Nenhum SQL ou schema novo é necessário.** Mantém-se a tabela `public.finance_data` com `payload jsonb` e políticas RLS existentes.

## Regras
- Despesa fora do cartão: mês da data do lançamento (entendida como pagamento).
- Faturas: mês da data digitada ao marcar como paga; parcelas apenas projetadas não entram no caixa.
- Faturas antigas salvas como `true`: para preservar compatibilidade, a data de vencimento funciona como aproximação; desmarque e marque novamente informando a data real.
- Despesas gerais x custos fixos: classificação escolhida na edição/cadastro. Lançamentos recorrentes antigos entram em custos fixos; outros antigos entram em despesas gerais.
- Investimentos: cada edição cria/atualiza registro histórico na data informada, sem mudar fluxo de caixa. Os registros anteriores sem data são tratados como avaliação atual na primeira edição, não como histórico retroativo comprovado.
- A distribuição de categorias inclui itens de cartões apenas quando a fatura é paga.

Faça backup JSON antes de publicar e depois teste com valores pequenos. Forçar cache com Ctrl+Shift+R.
