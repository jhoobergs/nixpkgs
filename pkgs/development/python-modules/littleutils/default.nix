{
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "littleutils";
  version = "0.2.4";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-x4NbAQIM7ULikRGLfXj7FrwtmhtPP0LzyzeHu02lPRk=";
  };

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [ "littleutils" ];

  meta = with lib; {
    description = "Small collection of Python utility functions";
    homepage = "https://github.com/alexmojaki/littleutils";
    changelog = "https://github.com/alexmojaki/littleutils/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ jluttine ];
  };
}
