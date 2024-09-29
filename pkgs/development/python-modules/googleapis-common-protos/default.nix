{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  grpc,
  protobuf,
}:

buildPythonPackage rec {
  pname = "googleapis-common-protos";
  version = "1.65.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-M0op0Hzdw6oB3uSYj5r9mykW7i/0nWt1cVXcDRl4UsA=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
    grpc
    protobuf
  ];

  # does not contain tests
  doCheck = false;

  pythonImportsCheck = [
    "google.api"
    "google.logging"
    "google.longrunning"
    "google.rpc"
    "google.type"
  ];

  meta = with lib; {
    description = "Common protobufs used in Google APIs";
    homepage = "https://github.com/googleapis/python-api-common-protos";
    license = licenses.asl20;
    maintainers = [ ];
  };
}
