#' Write List(SeqFasta) to Fasta Format
#'
#' @param list list of 'SeqFasta' objects
#' @param fname file name to write to
#' @export
#' @examples
#' write.fasta(list(SeqFasta), 'output.fa')
#'

write.fasta = function(lst, fname){
  if(class(lst[[1]])!='SeqFasta'){
    stop('Wrong class of list object')
  }
  con = file(fname, 'w')
  for(i in lst){
    cat(attr(i, 'Annotation'), i, file = con, sep = '\n', append = T)
  }
  close(con)
}
