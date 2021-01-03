#' Write List(SeqFastq) to Fastq Format
#'
#' @param list list of 'SeqFastq' objects
#' @param fname file name to write to
#' @export
#' @examples
#' write.fastq(list(SeqFastq), 'output.fq')
#'

write.fastq = function(lst, fname){
  if(class(lst[[1]])!='SeqFastq'){
    stop('Wrong class of list object')
  }
  con = file(fname, 'w')
  for(i in lst){
    cat(attr(i, 'info'), i, '+', attr(i, 'qscore'), file = con, sep = '\n', append = T)
  }
  close(con)
}
