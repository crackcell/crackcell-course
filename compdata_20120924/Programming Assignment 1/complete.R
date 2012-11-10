#'
#' Copyright (c) 2012, Menglong Tan <tanmenglong@gmail.com>
#'
#' This program is free software; you can redistribute it
#' and/or modify it under the terms of the GPL licence
#'
#'
#' @file complete.R
#' @author crackcell <tanmenglong@gmail.com>
#' @date Mon Oct  8 21:03:21 2012
#' @brief Assignment 1
#'

complete <- function(directory, idvec = 1:332) {
    #' @brief description
    #'
    #' @author Menglong Tan
    #' @param a description
    #' @return return blabla
    #' @callGraphPrimitives
    df <- data.frame(id = integer(), nobs = integer())
    for (id in idvec) {
        filename <- paste(directory, "/",
                          sprintf("%03d", as.integer(id)),
                          ".csv", sep = "")
        data <- read.csv(filename)
        nd <- data.frame(id = id,
                         nobs = nrow(na.omit(data)))
        df <- rbind(df, nd)
    }
    df
}

#print(complete("specdata", 1:3))
