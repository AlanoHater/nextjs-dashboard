# Release v1.0

Resumen corto

- Corrección crítica: fallo de login en producción causado por variables de entorno malformadas en Vercel (`AUTH_SECRET` vacío; `POSTGRES_URL` y `AUTH_TRUST_HOST` con `\r\n` embebidos). Se limpiaron y reescribieron las variables en scope `Production`.
- Se habilitó correctamente el endpoint de NextAuth en App Router exportando `handlers` desde `auth.ts` y añadiendo `app/api/auth/[...nextauth]/route.ts`.
- Cambios de runtime y DB:
  - Forzado fetchs en tiempo de ejecución con `noStore()` en `app/lib/data.ts`.
  - Desactivados prepared statements (`prepare: false`) en clientes Postgres para compatibilidad con poolers/pgbouncer (archivos: `data.ts`, `actions.ts`, `auth.ts`, `route.ts`).
  - Mejorados mensajes de error en `actions.ts` para identificar tipos reales de `AuthError`.

Otros ajustes finales

- `README.md` actualizado con instrucciones de instalación, variables y troubleshooting.
- `.gitignore` ampliado para evitar commits accidentales de dumps de entorno de Vercel.
- `app/layout.tsx` actualizado para resolver `metadataBase` desde `NEXT_PUBLIC_APP_URL` o `VERCEL_URL`.

Despliegue

- Producción: https://nextjs-dashboard-two-beta-gv44twa2mg.vercel.app

Notas de seguridad

- No versionar archivos con secretos. Verifica que `AUTH_SECRET` y `POSTGRES_URL` estén correctamente configurados en Vercel (Production) y sin comillas/saltos de línea.

Cómo reproducir localmente

1. Añadir variables en `.env.local` (`POSTGRES_URL`, `AUTH_SECRET`, `AUTH_TRUST_HOST=true`).
2. `pnpm install && pnpm dev`.
3. `GET /seed` para poblar la base de datos de ejemplo.

Gracias — proyecto listo para entrega.
