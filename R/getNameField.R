#' Get Namefield From Read Annotation
#'
#' This function extract keywords from read annotation.
#' @param object class 'SeqFastq'/'SeqFasta' object
#' @param split characters to split the annotation line
#' @export getNameField
#' @examples
#' file = system.file('data/ref.fa', package = 'seqtools')
#' fasta = read.fasta(file)
#' getNameField(fasta[[1]])

#' @import magrittr

getNameField = function(object, split = NULL) UseMethod('getNameField')

#' @rdname getNameField
#' @export
getNameField.SeqFasta = function(object, split = '=| |[|]'){
  tmp = (attr(object,'Annotation') %>% strsplit(x = ., split))[[1]]
  return(tmp[seq(2,length(tmp),2)])
}

#' @rdname getNameField
#' @export
getNameField.SeqFastq = function(object, split = '=| |[|]'){
  tmp = (attr(object,'info') %>% strsplit(x = ., split))[[1]]
  return(tmp[seq(2,length(tmp),2)])
}
