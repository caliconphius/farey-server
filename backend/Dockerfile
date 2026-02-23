# ── Build stage ───────────────────────────────────────────────────────────────
FROM julia:1.12.5 AS builder

WORKDIR /app

# Copy dependency manifests first (better layer caching)
COPY Project.toml setup.jl ./

# Pre-compile/instantiate dependencies
RUN julia --project=. setup.jl
# Copy source
COPY src/ ./src/

# ── Runtime stage ─────────────────────────────────────────────────────────────
FROM julia:1.12.5 AS runtime

WORKDIR /app

# Copy compiled depot and project from builder
COPY --from=builder /root/.julia /root/.julia
COPY --from=builder /app /app

CMD ["julia", "--project=.", "src/server.jl"]
