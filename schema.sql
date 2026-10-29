-- Execute no SQL Editor do Supabase. Cada usuário acessa apenas o próprio registro.
create table if not exists public.finance_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.finance_data enable row level security;
create policy "Usuário lê seus dados" on public.finance_data for select to authenticated using ((select auth.uid()) = user_id);
create policy "Usuário cria seus dados" on public.finance_data for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Usuário altera seus dados" on public.finance_data for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "Usuário exclui seus dados" on public.finance_data for delete to authenticated using ((select auth.uid()) = user_id);
grant select, insert, update, delete on public.finance_data to authenticated;
