################################################################################
# Helper function to find weekends from weekdays

# Can use this function with sapply on a df with a date column

isWeekend <- function(date) {
        day <- weekdays(as.Date(date))
        if(day %in% c("Saturday", "Sunday")) {
                TRUE
        }else {
                FALSE
        }
}

# Usage

data$weekend <- as.factor(sapply(data$date, isWeekend)) #creates new true/false column