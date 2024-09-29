{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  poetry-core,

  # dependencies
  ntc-templates,
  paramiko,
  pyserial,
  pyyaml,
  scp,
  textfsm,
}:

buildPythonPackage rec {
  pname = "netmiko";
  version = "4.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Jf8SN5dqo/8srPBJSTFGOMiZIgoWdb0CnjGwfOIM47Y=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace "poetry==1.3.2" "poetry-core" \
      --replace "poetry.masonry.api" "poetry.core.masonry.api"
  '';

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [
    ntc-templates
    paramiko
    pyserial
    pyyaml
    scp
    textfsm
  ];

  # tests require closed-source pyats and genie packages
  doCheck = false;

  meta = with lib; {
    description = "Multi-vendor library to simplify Paramiko SSH connections to network devices";
    homepage = "https://github.com/ktbyers/netmiko/";
    license = licenses.mit;
    maintainers = [ maintainers.astro ];
  };
}
