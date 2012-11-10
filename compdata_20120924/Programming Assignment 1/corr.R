#'
#' Copyright (c) 2012, Menglong Tan <tanmenglong@gmail.com>
#'
#' This program is free software; you can redistribute it
#' and/or modify it under the terms of the GPL licence
#'
#'
#' @file corr.R
#' @author crackcell <tanmenglong@gmail.com>
#' @date Mon Oct  8 22:01:11 2012
#' @brief Assignment 1
#'

corr <- function(directory, threshold = 0) {
    #' @brief description
    #'
    #' @author Menglong Tan
    #' @param a description
    #' @return return blabla
    #' @callGraphPrimitives
    cr <- c()
    for (id in 1:332) {
        filename <- paste(directory, "/",
                          sprintf("%03d", as.integer(id)), ".csv", sep = "")
        data <- na.omit(read.csv(filename))
        complete <- nrow(data)
        if (complete <= threshold) {
            next
        }
        sulfate <- data[["sulfate"]]
        nitrate <- data[["nitrate"]]
        cr <- c(cr, cor(sulfate, nitrate))
    }
    cr
}
#cr <- corr("specdata", 150)
#head(cr)
