{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pytestCheckHook,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "home-assistant-intents";
  version = "2026.2.13";
  pyproject = true;

  src = fetchPypi {
    pname = "home_assistant_intents";
    inherit version;
    hash = "sha256-iTLfj2gthlbZi+FvB4AvqOiPW9lpHdlPMKoZDSDIH10=";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [
    pytestCheckHook
    pyyaml
  ];

  pythonImportsCheck = [ "home_assistant_intents" ];

  meta = with lib; {
    description = "Intents for Home Assistant";
    homepage = "https://github.com/home-assistant/intents";
    license = licenses.cc-by-40;
    teams = [ lib.teams.home-assistant ];
  };
}
