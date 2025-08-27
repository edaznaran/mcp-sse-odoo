FROM python:3.12-slim-trixie
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy the project into the image
ADD . /app

# Sync the project into a new environment, asserting the lockfile is up to date
WORKDIR /app

ENV PATH="/app/.venv/bin:$PATH"

RUN uv add "mcp[cli]"
RUN uv sync --locked

# Expose the application port
EXPOSE 8000


# Presuming there is a `my_app` command provided by the project
CMD ["uv", "run", "uvicorn", "server:starlette_app", "--host", "0.0.0.0", "--port", "8000"]