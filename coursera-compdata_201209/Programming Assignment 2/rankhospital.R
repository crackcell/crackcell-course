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

rankhospital <- function(state, outcome, num = "best") {
    outcome.hospital <- merge(read.csv("outcome-of-care-measures.csv",
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
      na.omit(outcome.hospital[outcome.hospital$State.y == state,])

    if (num == "best") {
        num <- 1;
    } else if (is.numeric(num) && num > nrow(outcome.hospital.by.state)) {
        return(NA)
    } else if (num == "worst") {
        num <- nrow(outcome.hospital.by.state)
    }

    outcome.hospital.sort <-
      outcome.hospital.by.state[order(outcome.hospital.by.state[,col.id],
                                outcome.hospital.by.state[,2]),]
    hospital.name <- outcome.hospital.sort[num, 2]
    return(hospital.name)
}
