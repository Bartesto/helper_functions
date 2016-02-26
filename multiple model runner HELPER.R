rm(list=ls())

dat <- data.frame(x1 = rnorm(100, m=50), x2 = rnorm(100, m=50), 
                  x3 = rnorm(100, m=50), y = rnorm(100))

mods <- vector("list", length(names(dat))-1)


for(i in 1:length(mods)){
  x.i <- as.character(names(dat)[i])
  new_mod <- function(x.i){
    lstt = list(formula=as.formula(paste("y ~ ", x.i, sep="")), 
                data=as.name("dat"))
    summary(do.call("lm", lstt))
  }
  mods[[i]] <- new_mod(x.i)
}


mods


## NOTE as.formula and as.name

x <- 4
y <- x * 10
y

ee = expression(y~x1)

z <- quote(y <- x * 10)
z

is.expression(ee)
is.call(z)


replace <- list(x1 = as.name("alphabet"), x2 = as.name("zoology"))
substitute(expression(x1 + x2 + log(x1) + x3), replace)
