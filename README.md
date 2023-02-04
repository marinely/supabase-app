## Supabase App

This repository hosts the schema, functions, and configuration for the Marinely Supabase backend.
Local development is performed via the supabase CLI.

## Pre-requisites

1. Install [docker](https://docs.docker.com/get-docker/)
2. Generate an [access token](https://app.supabase.com/account/tokens) for Supabase  
   Use the following naming convention: `{your_name}_local_development`, i.e. "daniel_local_development"

## Getting Started

2. Clone this repo `git clone git@github.com:marinely/supabase-app.git`
3. Navigate to the repository: `cd supabase-app`
4. Install dependencies: `npm install`
5. Log in with the access token you created in the pre-requisites: `npx supabase login`
6. With Docker running, start the local environment: `npm start`
7. To stop: `npm stop`

## Schema Migrations

1. Checkout a new feature branch from the working branch: `git checkout develop && git checkout -b feature/my_migration`
2. Create a new migration file: `supabase migration new my_migration_name`
3. Write your DDL statement(s) into the newly created script file at /supabase/migrations/{timestamp}\_{my_migration_name}
4. Execute your migration: `supabase db reset`  
   _Note that this will recreate your local DB from scratch, and apply every migration inside the /migrations directory in sequence_
5. Update the typescript schema file to reflect your changes: `npx supabase gen types typescript --local > ./supabase/schema.ts`
6. Push your branch and open a pull request

An alternative to a manual DDL statement is to (a) make the equivalent DB change using the Supabase Studio UI in your local environment, then (b) running a `diff` command to auto-generate a migration file.
Note that while this may work for very simple migrations, it should never be pushed without manual inspection.

## Deploying

This repository uses Github Actions to automatically deploy to both staging and production.

1. Merging to develop results in a deployment to staging
2. Merging to main results in a deployment to production
