module.exports = (filepath, base = ".") ->
  if (mod = require.cache[filepath])?
    delete require.cache[filepath]
    console.log "deleted cache for #{filepath}"
    while (id = mod.parent?.id) != base
      delete require.cache[id]
      console.log "deleted cache for #{id}"
      mod = mod.parent