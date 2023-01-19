
create table public.profile (
  id uuid not null references auth.users on delete cascade,
  first_name text,
  last_name text,
  email text,
  phone text,
  zip_code text,

  primary key(id)
);
