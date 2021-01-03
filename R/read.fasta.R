#' Read File in Fasta format
#'
#' Read fasta, return a list of 'SeqFasta' object
#' @param fname filename
#' @export
#' @examples
#' file = system.file('data/ref.fa', package = 'seqtools')
#' fasta = read.fasta(file)
#' head(fasta)
#'

read.fasta = function(fname){
  con1 = file(fname, open = 'r')
  fasta_txt = readLines(con1) # read file:'fname' into plain charaters
  close(con1)
  marked_lines = grep('>',fasta_txt) # lines started with '>'
  read_region = Map(function(x,y){return(c(x,y))},
                    marked_lines,
                    c(marked_lines[-1]-1, length(fasta_txt)))
  readnames = sapply(fasta_txt[marked_lines],function(x){strsplit(x,'>| ')[[1]][2]}) # get read names
  names(read_region) = readnames

  fasta = sapply(read_region,function(x){
    annotation = fasta_txt[x[1]]
    seq = fasta_txt[(x[1]+1):x[2]]
    seq =  c2s(seq)
    name = strsplit(annotation,'>| ')[[1]][2]
    read = as.SeqFasta(seq,name,annotation)
    return(list(read))
  }
  )
  return(fasta)
}
