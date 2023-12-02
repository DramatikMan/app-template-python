import httpx


def test_web_api_index() -> None:
    response = httpx.get("http://0.0.0.0:8080")
    response_data = response.json()
    assert response_data["msg"] == "This is a web API response."
