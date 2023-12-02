from app.main import greeting


def test_greeting() -> None:
    assert greeting() == "Python environment."
