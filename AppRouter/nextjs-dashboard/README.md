# Next.js Dashboard (App Router)

Proyecto finalizado basado en el curso de Next.js App Router, con autenticacion por credenciales (NextAuth v5), dashboard protegido y persistencia en Postgres (Supabase pooler).

## Stack

- Next.js (App Router)
- React + TypeScript
- Tailwind CSS
- NextAuth v5 (Credentials Provider)
- Postgres via `postgres` client

## Requisitos

- Node.js 18+
- pnpm
- Base de datos Postgres accesible desde local y/o Vercel

## Variables de entorno

Variables minimas requeridas:

- `POSTGRES_URL`
- `AUTH_SECRET`
- `AUTH_TRUST_HOST=true`

Notas:

- No uses `AUTH_URL=http://localhost:3000/api/auth` en produccion.
- Asegura que `POSTGRES_URL` no tenga comillas extra ni saltos de linea (`\r\n`).
- En Vercel, valida que las variables esten en scope `Production`.

## Instalacion y ejecucion local

1. Instalar dependencias:

```bash
pnpm install
```

2. Configurar variables en `.env.local`.

3. Levantar en desarrollo:

```bash
pnpm dev
```

4. Abrir `http://localhost:3000`.

## Seed de base de datos

Con la app corriendo, ejecutar una vez:

- `GET /seed`

Esto crea tablas y datos de ejemplo (`users`, `customers`, `invoices`, `revenue`).

Credenciales de prueba despues del seed:

- Email: `user@nextmail.com`
- Password: `123456`

## Scripts

- `pnpm dev` - desarrollo
- `pnpm build` - build de produccion
- `pnpm start` - iniciar build de produccion
- `pnpm lint` - lint del proyecto

## Deploy en Vercel

1. Configurar variables de entorno en `Production`:
	 - `POSTGRES_URL`
	 - `AUTH_SECRET`
	 - `AUTH_TRUST_HOST=true`
2. Hacer deploy/redeploy.
3. Verificar login en `/login` y acceso a `/dashboard`.

## Troubleshooting rapido

- Error: `Something went wrong` al iniciar sesion
	- Revisar `AUTH_SECRET` en Vercel (no vacio).
	- Revisar `POSTGRES_URL` sin saltos de linea ni valores locales.
	- Confirmar `AUTH_TRUST_HOST=true`.

- Redireccion a `localhost` en produccion
	- Eliminar cualquier `AUTH_URL` hardcodeado a local.
	- Redeploy para refrescar variables.

- Errores de DB con pooler
	- Mantener `prepare: false` en clientes Postgres para evitar problemas con pgbouncer/poolers.

## Estado

- Proyecto completado y desplegado.
- Flujo de autenticacion y dashboard funcionales en produccion.
