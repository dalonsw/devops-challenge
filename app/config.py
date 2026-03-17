import os
"""Configurações da aplicação, carregadas a partir de variáveis de ambiente.
"""

APP_ENV = os.getenv("APP_ENV", "DEV")
HOST = os.getenv("HOST", "0.0.0.0")
PORT = int(os.getenv("PORT", "8080"))
VERSION = "1.0.0"
