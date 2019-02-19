# rankhospital: the 2-character abbreviated name of a state (state), 
# an outcome (outcome), the ranking of a hospital in that state for that outcome
# (num).

# this needs to be optimized and cleaned up so badly but it still works.


rankhospital <- function(state, outcome, num){
        # read the outcome data
        out <- read.csv("outcome-of-care-measures.csv")
        sorted <- out[out$State == state, ]
        death <- c("heart failure", "heart attack", "pneumonia")
        
        # check that state and outcome are valid. 
        if(any(state == state.abb)) {
        } else { stop("Invalid state")}       
        if(any(outcome == death)){
        } else { stop("Invalid outcome")}

        
        if(outcome == "heart failure") {
                na <- sorted[!is.na(as.numeric(as.character(sorted[, 17]))), ]
                rank <- na[order(as.numeric(as.character(na[, 17])), na$Hospital.Name), ]
                
                if(num == "worst") {
                        answer <- rank$Hospital.Name[nrow(rank)] 
                }
                else {
                        answer <- rank$Hospital.Name[num]
                }
                if(num == "best") {
                        answer <- rank[1, 2] 
                }
                else {
                        answer <- rank$Hospital.Name[num]
                }
                if(num >= nrow(rank)+1) {
                        stop("higher than available sample number; NA")}

        }
        
        if(outcome == "heart attack") {
                na <- sorted[!is.na(as.numeric(as.character(sorted[, 11]))), ]
                rank <- na[order(as.numeric(as.character(na[, 11])), na$Hospital.Name), ]
                if(num == "worst") {
                        answer <- rank$Hospital.Name[nrow(rank)] 
                }
                else {
                        answer <- rank$Hospital.Name[num]
                }
                if(num == "best") {
                        answer <- rank[1, 2] 
                }
                else {
                        answer <- rank$Hospital.Name[num]
                }

        }
        
        if(outcome == "pneumonia") {
                na <- sorted[!is.na(as.numeric(as.character(sorted[, 23]))), ]
                rank <- na[order(as.numeric(as.character(na[, 23])), na$Hospital.Name), ]
                if(num == "worst") {
                        answer <- rank$Hospital.Name[nrow(rank)] 
                }
                else {
                        answer <- rank$Hospital.Name[num]
                }
                if(num == "best") {
                        answer <- rank[1, 2] 
                }
                else {
                        answer <- rank$Hospital.Name[num]
                }
                if(num >= nrow(rank)+1) {
                        stop("higher than available sample number; NA")}
        }
        return(answer)
}


