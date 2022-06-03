
#' Read AGAT LIMS data files
#'
#' @param path Path to stored ICP-MS files
#' @param sheet_name Name of MS Excel sheet where data are stored
#' @param first_line The first column matches this pattern at the first line of data.
#' As an input to `stringr::str_detect()`, this can be a partial match or a regex.
#' @param meta_rows How many rows contain metadata that should appear in the column names? Default is 4.
#' @param work_order The AGAT LIMS work order number. Used to select columns containing numeric data.
#'
#' @return A tibble with columns `param`, `unit`, `rdl` (detection limit), `value`,
#' `date`, `bdl` (below detection indicator), and `sample`
#' @importFrom dplyr mutate select slice rename_with %>%
#' @importFrom stringr str_detect str_extract str_remove
#' @importFrom tidyr replace_na pivot_longer
#' @importFrom tidyselect starts_with
#' @importFrom rlang .data
#' @importFrom janitor clean_names excel_numeric_to_date
#' @importFrom glue glue
#' @importFrom readxl read_excel
#' @export
#'
#' @examples
#' file <- list.files(
#'    path = system.file("extdata", package = "cwrshelpr"),
#'    full.names = TRUE,
#'    pattern = ".+\\.xlsx"
#' )
#' read_lims(file[3], work_order = "00A123456")
read_lims <- function(
  path,
  sheet_name = 1,
  first_line = "AGAT Workorder",
  meta_rows = 4,
  work_order
) {
  path %>%
    read_excel(col_names = FALSE) %>%
    start_here(first_line) %>%
    rename_multirow(meta_rows, remove_na = TRUE) %>%
    slice(-seq_len(meta_rows)) %>%
    pivot_longer(
      starts_with(work_order)
    ) %>%
    clean_names() %>%
    select(param = .data$parameter_name, .data$unit, .data$rdl, .data$name, .data$value) %>%
    mutate(
      work_order = str_extract(.data$name, "[^_]+"),
      date_raw = str_extract(.data$name, "(?<=_)[^_]+"),
      date = excel_numeric_to_date(as.numeric(.data$date_raw)),
      sample = str_extract(.data$name, glue("(?<={work_order}_{date_raw}_)[^_]+")),
      bdl = str_detect(.data$value, "<"),
      value = as.numeric(str_remove(.data$value, "<"))
    ) %>%
    select(-c(.data$name, .data$work_order, .data$date_raw))

}
