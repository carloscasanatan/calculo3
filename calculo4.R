#' Imprime el código original DeepSeek con formato y comentarios
#'
#' @export
calculo4 <- function() {
  cat(
'library(httr)
library(jsonlite)
h <- list()
d <- function(p, m = "deepseek-chat") {
  h <<- c(h, list(list(role = "user", content = p)))
  r <- POST("https://api.deepseek.com/v1/chat/completions",
            add_headers(Authorization = paste("Bearer", Sys.getenv("DEEPSEEK_API_KEY")), 
                        "Content-Type" = "application/json"),
            body = toJSON(list(model = m, messages = h), auto_unbox = TRUE))
  if (http_error(r)) stop(content(r, "text"))
  j <- fromJSON(content(r, "text"), simplifyVector = FALSE)
  h <<- c(h, list(list(role = "assistant", content = j$choices[[1]]$message$content)))
  j$choices[[1]]$message$content
}
#> Sys.setenv(DEEPSEEK_API_KEY = "sk-0454fe125d1548458a224eb5d6e6556b")
cat(d("cual era mi nombre?"))
'
  )
}

