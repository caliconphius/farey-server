# farey-server

## Structure

```{}
farey-server/
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
| GET    | `/`           |      "Hello World"     |
