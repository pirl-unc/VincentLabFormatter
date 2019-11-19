#' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' post_process_cibersortx
#' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' @title post_process_cibersortx
#'
#' @description
#' Formats CIBERSORTx output file
#'
#' @param input_file Single file name.
#' @param output_dir Path to the output folder.
#'
#' @return A path to the rds file.
#'
#' @export
post_process_cibersortx = function(
  input_file, #  system(paste0("ls ", RAW_DATA_DIR, "/cibersortx/CIBERSORTx_Job*_Adjusted.txt"), intern = TRUE)
  output_dir # = file.path(base_dir, "post_processing", "cibersortx")
){

  dat = data.table::fread(input_file)
  colnames(dat) = gsub(" ", "_", stringi::stri_trans_totitle(colnames(dat)))
  data.table::setnames(dat, "Mixture", "Sample_ID")
  data.table::setnames(dat, "P-Value", "pValue")

  dir.create(output_dir, showWarnings = F)
  cibersort_output_path = file.path(output_dir, "cell_fraction_data.tsv")

  data.table::fwrite(dat, cibersort_output_path, sep = "\t")
}
