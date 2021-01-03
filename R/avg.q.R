#' Calculate Average Qscore
#'
#' Generic function calculates average qscore of a S3 'SeqFastq' object.
#' @param object class 'SeqFastq' object
#' @export avg.q
#' @examples
#' avg.q()

avg.q = function(object){UseMethod('avg.q')}

#' @rdname  avg.q
#' @export 
avg.q.SeqFastq = function(object){
  x = (gtools::asc(attr(object, 'qscore')) %>% drop)-33
  -10*log10(mean(10^(x/-10)))
}
