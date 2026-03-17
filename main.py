import os
import uvicorn
from fastapi import FastAPI, status
from fastapi.responses import JSONResponse

app = FastAPI()

APP_ENV = os.getenv("APP_ENV", "DEV")
PORT = int(os.getenv("PORT", 8080))
HOST = os.getenv("HOST", "127.0.0.1")

@app.get("/health")
def health():
    data = {
        "status": "ok",
        "version": "1.0.0",
        "environment": APP_ENV
    }
    return JSONResponse(content=data, status_code=status.HTTP_200_OK)

if __name__ == "__main__":
    print(f"Starting server in {APP_ENV} environment on {HOST}:{PORT}")
    uvicorn.run(app, host=HOST, port=PORT)