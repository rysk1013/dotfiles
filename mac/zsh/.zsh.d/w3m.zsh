ddg() {
  local query="${(j:+:)@}"
  w3m "https://html.duckduckgo.com/html/?q=${query// /+}"
}
