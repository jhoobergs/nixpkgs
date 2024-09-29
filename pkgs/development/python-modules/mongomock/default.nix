{
  lib,
  buildPythonPackage,
  fetchPypi,
  packaging,
  pbr,
  pytestCheckHook,
  pythonOlder,
  sentinels,
}:

buildPythonPackage rec {
  pname = "mongomock";
  version = "4.2.0.post1";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-kkHSzscnS5c22+jtrLGVKP9mrzs3ebMk157MQgEifzE=";
  };

  nativeBuildInputs = [ pbr ];

  propagatedBuildInputs = [
    packaging
    sentinels
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "mongomock" ];

  meta = with lib; {
    homepage = "https://github.com/mongomock/mongomock";
    description = "Fake pymongo stub for testing simple MongoDB-dependent code";
    license = licenses.bsd3;
    maintainers = with maintainers; [ gador ];
  };
}
