#'
#' Copyright (c) 2012, Menglong Tan <tanmenglong@gmail.com>
#'
#' This program is free software; you can redistribute it
#' and/or modify it under the terms of the GPL licence
#'
#'
#' @file part1.R
#' @author crackcell <tanmenglong@gmail.com>
#' @date Mon Oct  8 19:37:44 2012
#' @brief Programming Assignment 1
#'

getmonitor <- function(id, directory, summarize = FALSE) {
    #' @brief description
    #'
    #' @param a description
    #' @return return blabla
    #' @callGraphPrimitives

    path <- paste(directory, "/", sprintf("%03d", as.integer(id)), ".csv",
                  sep = "")
    data <- as.data.frame(read.csv(path))
    if (summarize == TRUE) {
        print(summary(data))
    }
    return(data)
}

#data <- getmonitor(1, "specdata")
#head(data)
#data <- getmonitor(2, "specdata", summarize = TRUE)
#source("http://spark-public.s3.amazonaws.com/compdata/scripts/getmonitor-test.R")
#getmonitor.testscript()
