{
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
  six,
}:

buildPythonPackage rec {
  pname = "jaraco-stream";
  version = "3.0.4";
  format = "setuptools";

  src = fetchPypi {
    pname = "jaraco.stream";
    inherit version;
    sha256 = "sha256-4rxQKOch7SzIUrluyaM/K3Zk6bLb+H7vvmF9EmZBk0s=";
  };

  pythonNamespaces = [ "jaraco" ];

  doCheck = false;
  buildInputs = [ setuptools-scm ];
  propagatedBuildInputs = [ six ];
}
