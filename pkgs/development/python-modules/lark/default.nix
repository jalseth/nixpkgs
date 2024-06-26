{ lib
, buildPythonPackage
, fetchFromGitHub
, regex
, pytestCheckHook
, js2py
, setuptools
}:

buildPythonPackage rec {
  pname = "lark";
  version = "1.1.8";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "lark-parser";
    repo = "lark";
    rev = "refs/tags/${version}";
    hash = "sha256-bGNoQeiAC2JIFOhgYUnc+nApa2ovFzXnpl9JQAE11hM=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  # Optional import, but fixes some re known bugs & allows advanced regex features
  propagatedBuildInputs = [ regex ];

  pythonImportsCheck = [
    "lark"
    "lark.parsers"
    "lark.tools"
    "lark.grammars"
  ];

  nativeCheckInputs = [
    js2py
    pytestCheckHook
  ];

  meta = with lib; {
    description = "A modern parsing library for Python, implementing Earley & LALR(1) and an easy interface";
    homepage = "https://lark-parser.readthedocs.io/";
    changelog = "https://github.com/lark-parser/lark/releases/tag/${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ fridh drewrisinger ];
  };
}
