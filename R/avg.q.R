#' Calculate Average Qscore
#'
#' Generic function calculates average qscore of a S3 'SeqFastq' object.
#' @param object class 'SeqFastq' object
#' @export avg.q
#' @examples
#' avg.q()

avg.q = function(object, round = T){UseMethod('avg.q')}

#' @import magrittr
#' @import gtools
#' @rdname  avg.q
#' @export 
avg.q.SeqFastq = function(object, round = T){
  x = (gtools::asc(attr(object, 'qscore')) %>% drop)-33
  o = -10*log10(mean(10^(x/-10)))
  if(round){
    o = round(o, 1)
  }
  return(o)
}
