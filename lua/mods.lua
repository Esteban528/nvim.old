

local home = os.getenv('HOME')
local jdtls_path = home..'/.local/share/nvim/mason/packages/jdtls'
local lombok_path = jdtls_path..'/lombok.jar'           -- Asegúrate de poner la ruta correcta a lombok.jar

local config = {
  cmd = {
    'java', '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1G',
    '-jar', jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.6.800.v20240330-1250.jar',
    '-configuration', jdtls_path .. '/config_linux',
    '-data', home .. '/.workspace',
    '-javaagent: '..lombok_path,
  },
  --[[ settings = {
    java = {
      home = '/usr/lib/jvm/java-17-openjdk',  -- Configura la ruta a tu JDK
      import = {
        lombok = {
          jarPath = lombok_path -- Asegúrate de poner la ruta correcta a lombok.jar
        }
      }
    } 
  }]]
}


  vim.print(lombok_path)
local lspconfig = require 'lspconfig'
if (lspconfig.jdtls) then
  lspconfig.jdtls.setup(config)
  -- vim.cmd(':echo '..lombok_path);
end
