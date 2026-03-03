from fastapi import FastAPI

app = FastAPI(title="Minimal FastAPI app")


@app.get("/")
async def read_root():
    return {"message": "Hello from FastAPI in Docker! №2"}


@app.get("/health")
async def health_check():
    return {"status": "ok"}


if __name__ == "__main__":
    import uvicorn

    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)

