import uvicorn
from fastapi import FastAPI, status
from fastapi.responses import JSONResponse
"""Aplicação FastAPI para o desafio DevOps, com um endpoint de saúde e configuração via variáveis de ambiente."""

from app.config import APP_ENV, HOST, PORT, VERSION

app = FastAPI()


@app.get("/health")
def health():
    """Endpoint de saúde para verificar se o serviço está funcionando corretamente."""
    data = {
        "status": "ok",
        "version": VERSION,
        "environment": APP_ENV
    }
    return JSONResponse(content=data, status_code=status.HTTP_200_OK)

if __name__ == "__main__":
    print(f"Starting server in {APP_ENV} environment on {HOST}:{PORT}")
    uvicorn.run(app, host=HOST, port=PORT)
    