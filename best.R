# finding the best hospital in a state. 

# arguments: 2 character abbreviated name of a state and an outcome name. 
# outcome: "heart attack", "heart failure", or "pneumonia".
# returns a character vector with the name of the hospital that has the lowest
# 30-day mortality for the specified outcome in that state. 
# hospitals without valid outcomes are excluded

best <- function(state, outcome){
        # read the outcome-of-care-mesaures.csv
        out <- read.csv("outcome-of-care-measures.csv")
        sort <- out[out$State == state, ]
        death <- c("heart failure", "heart attack", "pneumonia")
        
        # check that state and outcome are valid. 
        if(any(state == state.abb)) {
        } else { stop("Invalid state")}       
        if(any(outcome == death)){
        } else { stop("Invalid outcome")}
        
        if(outcome == "heart failure") {
                HF <- as.numeric(as.character(
                        sort$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
                HFno <- HF[!is.na(HF)]
                HFmin <- min(HFno) # gives the minimum value in 30d death from HA
                HFrow <- which(
                        sort$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == HFmin)
                bestanswer <- sort$Hospital.Name[HFrow]
        } #don't know why this method works for heart failure but not heart attack. need to figure out
        
        if(outcome == "heart attack") {
                HAmin <- which.min(
                        sort$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
                bestanswer <- sort$Hospital.Name[HAmin]
        }
        
        if(outcome == "pneumonia") {
                P <- as.numeric(
                        as.character(sort$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
                Pno <- P[!is.na(P)]
                Pmin <- min(Pno) # gives the minimum value in 30d death from HA
                Prow <- which(sort$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == Pmin)
                bestanswer <- sort$Hospital.Name[Prow]
        } #don't know why this method doesn't work for heart attack. need to figure out

        # return hospital name in that state with lowest 30d death rate as
        # character vector
        return(bestanswer)
}


