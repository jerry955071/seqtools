#' Useful Utilitys for Genomic Data
#' @export s2c c2s base_complement reverse_complement
#' @export 
#' @export 
#' @export 
#' 


s2c = function(string){
  return(strsplit(string, '')[[1]])
}

c2s = function(chr_vector){
  return(paste(chr_vector, collapse = ''))
}

base_complement = function(base){
  if(base %in% c('A','T','C','G')){
    comp = list('A'='T', 'T'='A', 'C'='G', 'G'='C',
                'a'='t', 't'='a', 'c'='g', 'g'='c')
    return(as.character(comp[base]))
  }else{
    return('N')
  }
}

reverse_complement = function(Sequence){
  s = s2c(Sequence)
  o = as.character(sapply(s, base_complement))
  o = c2s(o[length(o):1])
  return(o)
}

