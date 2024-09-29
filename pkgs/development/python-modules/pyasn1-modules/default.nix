{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pyasn1,
  pytestCheckHook,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "pyasn1-modules";
  version = "0.4.1";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "pyasn1";
    repo = "pyasn1-modules";
    rev = "refs/tags/v${version}";
    hash = "sha256-7tCmhADC8LuswonL4QQ01/DD0RzeRLFJrsU49On4fqY=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyasn1 ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "pyasn1_modules" ];

  meta = {
    description = "Collection of ASN.1-based protocols modules";
    homepage = "https://pyasn1.readthedocs.io";
    changelog = "https://github.com/pyasn1/pyasn1-modules/releases/tag/v${version}";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
