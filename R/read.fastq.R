#' Read File in Fastq format
#'
#' Read fasta, return a list of 'SeqFastq' object
#' @param fname filename
#' @export
#' @examples
#' file = system.file('data/Long-read.fastq', package = 'seqtools')
#' fastq = read.fastq(file)
#' head(fastq)
#'

read.fastq = function(fname){
  con1 = file(fname, open = 'r')
  fastq_txt = readLines(con1) # read file:'fname' into plain charaters
  close(con1)
  run_info = fastq_txt[seq(1,length(fastq_txt),4)]
  if(!all(grepl('^@',run_info))){
    stop(paste0('Invalid fastq format at line: ', (which(!grepl('^@',run_info))-1)*4+1))
  }
  readnames = sapply(run_info, function(x){strsplit(x,' ')[[1]][1]})
  seq =  fastq_txt[seq(1,length(fastq_txt),4)+1]
  qscore = fastq_txt[seq(1,length(fastq_txt),4)+3]
  out_fastq = Map(as.SeqFastq,seq,qscore,readnames,run_info)
  names(out_fastq) = readnames
  return(out_fastq)
}
