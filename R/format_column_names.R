#' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' format_column_names
#' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @title format_column_names
#'
#' @description
#' Formats column names in data frame in a uniform style
#'
#' @param input_data_frame a data frame or data table object
#'
#' @return A data frame or data table object
#'
#' @export
format_column_names = function(
  input_data_frame
){

  if (checkmate::checkClass(input_data_frame, "data.frame") & !checkmate::checkClass(input_data_frame, "data.table")) {
    input_type = "DF"
    input_data_frame = as.data.table(input_data_frame)
    assert(checkmate::checkDataTable(input_data_frame))
  } else if (checkmate::checkMultiClass(input_data_frame, c("data.frame", "data.table"))) {
    input_type = "DT"
  } else {
    assert(checkmate::checkDataFrame(input_data_frame))
  }

  colnames(input_data_frame) = gsub(" ", "_", stringi::stri_trans_totitle(colnames(input_data_frame)))
  col_num_pval = grep("p*value", colnames(input_data_frame), ignore.case=TRUE)
  colnames(input_data_frame)[col_num_pval] = "pValue"
  return(input_data_frame)

}
