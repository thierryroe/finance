-- Finance: eine Tabelle, jede Zeile gehört genau einem Login (Row Level Security)
create table if not exists public.items (
  user_id    uuid not null default auth.uid() references auth.users on delete cascade,
  k          text not null,
  v          jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, k)
);
create index if not exists items_user_updated on public.items (user_id, updated_at);

alter table public.items enable row level security;
drop policy if exists "Nur eigene Daten" on public.items;
create policy "Nur eigene Daten" on public.items
  for all to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create or replace function public.items_touch() returns trigger
language plpgsql set search_path = '' as $$
begin new.updated_at = now(); return new; end $$;
drop trigger if exists items_touch on public.items;
create trigger items_touch before insert or update on public.items
  for each row execute function public.items_touch();

revoke all on public.items from anon;
grant select, insert, update, delete on public.items to authenticated;
