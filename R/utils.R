#' Useful Utilitys for Genomic Data
#' @name utils
#' @aliases s2c 
#' @aliases c2s 
#' @aliases base_complement 
#' @aliases reverse_complement

#' @export s2c
s2c = function(string){
  return(strsplit(string, '')[[1]])
}

#' @export c2s
c2s = function(chr_vector){
  return(paste(chr_vector, collapse = ''))
}

#' @export base_complement
base_complement = function(base){
  if(base %in% c('A','T','C','G')){
    comp = list('A'='T', 'T'='A', 'C'='G', 'G'='C',
                'a'='t', 't'='a', 'c'='g', 'g'='c')
    return(as.character(comp[base]))
  }else{
    return('N')
  }
}

#' @export reverse_complement
reverse_complement = function(Sequence){
  s = s2c(Sequence)
  o = as.character(sapply(s, base_complement))
  o = c2s(o[length(o):1])
  return(o)
}

