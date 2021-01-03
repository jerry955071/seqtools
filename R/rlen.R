#' Calculate Read Length
#'
#' calculate read length
#' @param object class 'SeqFasta' or 'SeqFastq' object
#' @export
#' @examples
#' file = system.file('seqtools/data/long-read.fastq')
#' fastq = read.fastq(file)
#' read = fastq[[1]]
#' rlen(read)
#'

rlen = function(object){
   if(length(object)==1){
      return(nchar(object))
    }
    if(length(object)>1){
      return(length(object))
    }
  }
  
  

