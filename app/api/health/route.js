// Health check used by Docker, the deploy script and the load balancer.
// It must stay fast and must not depend on the database or other services:
// it answers "is this container able to serve requests?".
export const dynamic = "force-dynamic";

const startedAt = new Date().toISOString();

export function GET() {
  return Response.json(
    {
      status: "ok",
      version: process.env.APP_VERSION || "dev", // git commit SHA, set at build time
      builtAt: process.env.BUILD_TIME || "unknown",
      startedAt,
      uptimeSeconds: Math.round(process.uptime()),
    },
    { headers: { "Cache-Control": "no-store" } }
  );
}
