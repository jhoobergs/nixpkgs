{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  jaxtyping,
  pytestCheckHook,
  scipy,
  setuptools,
  setuptools-scm,
  torch,
  typeguard,
  wheel,
}:

buildPythonPackage rec {
  pname = "linear-operator";
  version = "0.5.3";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "cornellius-gp";
    repo = "linear_operator";
    rev = "refs/tags/v${version}";
    hash = "sha256-fKDVaHyaneV6MafJd/RT2InZO5cuYoC36YgzQhfIH8g=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
    wheel
  ];

  propagatedBuildInputs = [
    jaxtyping
    scipy
    torch
    typeguard
  ];

  pythonRelaxDeps = [ "typeguard" ];

  pythonImportsCheck = [ "linear_operator" ];

  nativeCheckInputs = [ pytestCheckHook ];

  disabledTests = [
    # flaky numerical tests
    "test_matmul_matrix_broadcast"
    "test_svd"
  ];

  meta = with lib; {
    description = "LinearOperator implementation to wrap the numerical nuts and bolts of GPyTorch";
    homepage = "https://github.com/cornellius-gp/linear_operator/";
    license = licenses.mit;
    maintainers = with maintainers; [ veprbl ];
  };
}
