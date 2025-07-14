#' Muestra el código original DeepSeek
#'
#' Imprime el código original para la API DeepSeek con formato y comentarios.
#' @export
calculo4 <- function() {
  cat("library(httr)\nlibrary(jsonlite)\nh <- list()\nd <- function(p, m = \"deepseek-chat\") {\n  h <<- c(h, list(list(role = \"user\", content = p)))\n  r <- POST(\"https://api.deepseek.com/v1/chat/completions\",\n            add_headers(Authorization = paste(\"Bearer\", Sys.getenv(\"DEEPSEEK_API_KEY\")), \n                        \"Content-Type\" = \"application/json\"),\n            body = toJSON(list(model = m, messages = h), auto_unbox = TRUE))\n  if (http_error(r)) stop(content(r, \"text\"))\n  j <- fromJSON(content(r, \"text\"), simplifyVector = FALSE)\n  h <<- c(h, list(list(role = \"assistant\", content = j$choices[[1]]$message$content)))\n  j$choices[[1]]$message$content\n}\n#> Sys.setenv(DEEPSEEK_API_KEY = \"sk-0454fe125d1548458a224eb5d6e6556b\")\n\ncat(d(\"cual era mi nombre?\"))\n")
}
