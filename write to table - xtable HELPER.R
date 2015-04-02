libarary(xtable)

df <- my data frame

#convert to table - digits refers to dec places, neg value converts to sci notation
table <- xtable(df, digits = c(0, 1, 3, -3))
print.xtable(table, type="html", file="test.html")

# The above creates a html. Open in browser, copy and paste a version that looks 
# table-like in Word (i.e. tabular format but no grid). Go to Insert>Table>Convert
# text...