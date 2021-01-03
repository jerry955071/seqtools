#' Set Namefield of a Read
#'
#' This function extend/rewrite read
#' @param object class 'SeqFastq'/'SeqFasta' object
#' @param method 'r': rewrite, 'e': extend
#' @param keyValue list(key = value)
#' @examples
#' file = system.file('data/ref.fa', package = 'seqtools')
#' fasta = read.fasta(file)
#' getNameField(fasta[[1]])
#' fasta[[1]] = setNameField(fasta[[1]], method = 'e', keyValue = list(newkey = 'value'))
#' fasta[[1]]
#'

#' @export setNameField
setNameField = function(object, method = NULL, keyValue = NULL, sep = NULL){
  UseMethod('setNameField')
}

#' @rdname setNameField
#' @export 
setNameField.SeqFasta = function(object, method = 'e', keyValue = NULL, sep = ' '){
  anno = attr(object, 'Annotation')
  k = Map(function(x,y){paste0(y,'=',x)}, keyValue, names(keyValue))
  k = paste(k, collapse = sep)
  if(method == 'e'){
    anno = paste(anno, k, collapse = sep)
  }
  if(method == 'r'){
    anno = paste0(substr(anno,1,1), k)
  }
  attr(object, 'Annotation') = anno
  return(object)
}

#' @rdname setNameField
#' @export 
setNameField.SeqFastq = function(object, method = 'e', keyValue = NULL, sep = ' '){
  anno = attr(object, 'info')
  k = Map(function(x,y){paste0(y,'=',x)}, keyValue, names(keyValue))
  k = paste(k, collapse = sep)
  if(method == 'e'){
    anno = paste(anno, k, collapse = sep)
  }
  if(method == 'r'){
    anno = paste0(substr(anno,1,1), k)
  }
  attr(object, 'info') = anno
  return(object)
}
