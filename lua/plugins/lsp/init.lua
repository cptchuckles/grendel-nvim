return require('plugins.combiner'):combine(
    require('plugins.lsp.core')
):combine(
    require('plugins.lsp.dotnet')
):combine(
    require('plugins.lsp.java')
)
