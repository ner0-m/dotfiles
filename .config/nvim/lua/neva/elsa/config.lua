local M = {}

local _myelsaconfig = _myelsaconfig or {}

_myelsaconfig["build_options"] = _myelsaconfig.build_options or {}

_myelsaconfig.build_options["BUILD_TYPE"] = "RelWithDebInfo"
_myelsaconfig.build_options["USE_CUDA"] = true
_myelsaconfig.build_options["USE_DNNL"] = true
_myelsaconfig.build_options["USE_CUDNN"] = false
_myelsaconfig.build_options["GENERATE_PYBINDS"] = false
_myelsaconfig.build_options["ENABLE_BENCHMARKS"] = false

M.config = _myelsaconfig

return M
