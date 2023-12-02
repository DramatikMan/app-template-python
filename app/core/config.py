from pydantic_settings import BaseSettings, SettingsConfigDict


class Config(BaseSettings):
    model_config = SettingsConfigDict(env_prefix="APP_", env_nested_delimiter="__")

    DEV: bool = False

    # API
    WEB_API_WORKERS: int = 2
    WEB_API_PORT: int = 8080


cfg = Config()
