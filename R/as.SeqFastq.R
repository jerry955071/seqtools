#' S3 Object 'SeqFastq'
#'
#' S3 objects designed for Genomic data
#' @param object Sequence
#' @export
#' @examples
#' fastq = as.SeqFastq('ATCGATCGATCGATCG',
#'                     Qscore = '#&$(U@(#!*#)!(#*'
#'                     ReadName = 'ReadName',
#'                     RunInfo = 'Run_info_from_sequencing_platform')
#' fastq

as.SeqFastq = function(object, Qscore = NULL, ReadName = NULL, RunInfo = NULL){
  attributes(object) = list( qscore = Qscore, name = ReadName, info = RunInfo)
  class(object) = 'SeqFastq'
  return(object)
}
