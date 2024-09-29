{
  lib,
  buildPythonPackage,
  fetchPypi,
  django,
}:

buildPythonPackage rec {
  pname = "django-multiselectfield";
  version = "0.1.13";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-Q31yYy9MDKQWlRkXYyUpw9HUK2K7bDwD4zlvpQJlvpQ=";
  };

  propagatedBuildInputs = [ django ];

  # No tests
  doCheck = false;

  meta = {
    description = "django-multiselectfield";
    homepage = "https://github.com/goinnn/django-multiselectfield";
    license = lib.licenses.lgpl3;
  };
}
