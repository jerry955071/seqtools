#' S3 Object 'SeqFasta'
#'
#' S3 objects designed for Genomic data
#' @param object Sequence
#' @export
#' @examples
#' fasta = as.SeqFasta('ATCGATCGATCGATCG',
#'                     GeneName = 'Potri.000001',
#'                     Annotation = '>Potri.000001 pacid=1000001 locus=Potri.000001')
#' fasta

as.SeqFasta = function(object, GeneName = NULL, Annotation = NULL){
  attributes(object)  = list(name = GeneName, Annotation = Annotation)
  class(object) = 'SeqFasta'
  return(object)
}
