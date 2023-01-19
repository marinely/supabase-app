## Getting Started

1. Install the supabase cli: `brew install supabase/tap/supabase`
2. Install [docker](https://docs.docker.com/get-docker/)
3. Clone this repo `git clone git@github.com:marinely/supabase-app.git`
4. Navigate to the repository: `cd supabase-app`
5. Log into Supabase via the CLI: `supabase login`
6. With Docker running, start supabase: `supabase start`

## Schema Migrations

1. Checkout a new feature branch from `develop`: `git checkout -b feature/my_migration`
2. Create a new migration file: `supabase migration new my_migration_name`
3. Write SQL DDL statements into the newly created script file at /supabase/migrations/{timestamp}\_{my_migration_name}
4. Execute your migration: `supabase db reset`  
   _Note that this will recreate your local DB from scratch, and apply every migration inside the /migrations directory in sequence_
5. Push your branch and open a pull request

An alternative to a manual DDL statement is to (a) make the equivalent DB change using the Supabase Studio UI in your local environment, then (b) running a `diff` command to auto-generate a migration file.
Note that while this may work for very simple migrations, it should never be pushed without manual inspection.
