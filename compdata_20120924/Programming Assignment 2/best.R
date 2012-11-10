#'
#' Copyright (c) 2012, Menglong Tan <tanmenglong@gmail.com>
#'
#' This program is free software; you can redistribute it
#' and/or modify it under the terms of the GPL licence
#'
#'
#' @file best.R
#' @author crackcell <tanmenglong@gmail.com>
#' @date Mon Oct 22 12:42:57 2012
#' @brief compdata programming assignment 2
#'

best <- function(state, outcome) {
    outcome.hospital <- merge(
                              read.csv("outcome-of-care-measures.csv",
                                       colClasses = "character"),
                              read.csv("hospital-data.csv",
                                       colClasses = "character"),
                              by = "Provider.Number")


    # check state
    states <- unique(outcome.hospital[,52])
    if (is.na(match(state, states))) {
        stop("invalid state")
    }

    col.id <- 11
    if (outcome == "heart attack") {
        col.id <- 11
    } else if (outcome == "heart failure") {
        col.id <- 17
    } else if (outcome == "pneumonia") {
        col.id <- 23
    } else {
        stop("invalid outcome")
    }

    outcome.hospital[,11] <- as.numeric(outcome.hospital[,11])
    outcome.hospital[,17] <- as.numeric(outcome.hospital[,17])
    outcome.hospital[,23] <- as.numeric(outcome.hospital[,23])

    outcome.hospital.by.state <-
      outcome.hospital[outcome.hospital$State.y == state,]

    outcome.hospital.sort <-
      outcome.hospital.by.state[order(outcome.hospital.by.state[,col.id]),]
    hospital.name <- outcome.hospital.sort[1, 2]
    return(hospital.name)
}
