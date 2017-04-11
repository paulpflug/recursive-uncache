module.exports = (filepath, base = ".", verbose) ->
  if (mod = require.cache[filepath])?
    delete require.cache[filepath]
    if verbose
      console.log "deleted cache for #{filepath}"
    while (id = mod.parent?.id) != base
      delete require.cache[id]
      if verbose
        console.log "deleted cache for #{id}"
      mod = mod.parent