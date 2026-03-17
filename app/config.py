"""
Configurações da aplicação, incluindo variáveis de ambiente para ambiente, host, porta e versão.
"""
import os


APP_ENV = os.getenv("APP_ENV", "DEV")
HOST = os.getenv("HOST", "0.0.0.0")
PORT = int(os.getenv("PORT", "8080"))
VERSION = "1.0.0"
