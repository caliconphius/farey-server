# Julia Mux Server (Docker)

A minimal HTTP server built with [Julia](https://julialang.org/) and [Mux.jl](https://github.com/JuliaWeb/Mux.jl), containerised with Docker.

## Project structure

```
julia-mux-server/
├── src/
│   └── server.jl        # Application entry point & route definitions
├── Dockerfile           # Multi-stage build (builder → slim runtime)
├── docker-compose.yml   # One-command local dev/run
├── Project.toml         # Julia package dependencies
└── .dockerignore
```

## Endpoints

| Method | Path          | Description            |
|--------|---------------|------------------------|
| GET    | `/health`     | Health check (JSON)    |
| GET    | `/hello`      | Returns "Hello, World!"|
| GET    | `/hello/:name`| Returns "Hello, <name>"|

## Quick start

### Docker Compose (recommended)

```bash
docker compose up --build
```

### Docker only

```bash
docker build -t julia-mux-server .
docker run -p 8080:8080 julia-mux-server
```

### Local (Julia installed)

```bash
julia --project=. -e "using Pkg; Pkg.instantiate()"
julia --project=. src/server.jl
```

## Configuration

| Variable    | Default | Description           |
|-------------|---------|-----------------------|
| `PORT`      | `8080`  | Port the server binds to |
| `HOST_PORT` | `8080`  | Host-side port (Compose only) |

## Adding routes

Open `src/server.jl` and follow the existing pattern:

```julia
function my_handler(req)
    Dict(:status => 200, :body => JSON.json(Dict("key" => "value")))
end

# Inside the @app block:
@get "/my-route" my_handler
```
# farey-server
