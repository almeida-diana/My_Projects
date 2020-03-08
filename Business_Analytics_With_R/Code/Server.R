library(shinydashboard)


shinyServer(function(input,output){
output$histogram <- renderPlot({hist(telco_na_rm$MonthlyCharges, breaks = input$bins , col ="orange" , xlab = "Monthly Charges", main = "Histogram!")
  })
 output$histogram1 <- renderPlot({plot1})
 output$histogram2 <- renderPlot({plot2})
 output$histogram3 <- renderPlot({plot3})
 output$histogram4 <- renderPlot({plot4})
 output$histogram5 <- renderPlot({plot5})
 output$histogram6 <- renderPlot({plot6})
 output$histogram7 <- renderPlot({plot7})
 output$histogram8 <- renderPlot({plot8})
 output$histogram9 <- renderPlot({plot9})
 output$histogram10 <- renderPlot({plot10})
 output$histogram11 <- renderPlot({plot11})
 output$histogram12 <- renderPlot({plot12})
 output$histogram13 <- renderPlot({plot13})
 output$histogram14 <- renderPlot({plot14})
 output$histogram15 <- renderPlot({plot15})
 output$histogram16 <- renderPlot({plot16})
 output$histogram17 <- renderPlot({plot17})
 output$histogram18 <- renderPlot({ggplot(data = teleco, aes(x = teleco$TotalCharges, fill = teleco$Churn)) +
     geom_histogram(position = "fill", binwidth= input$bw)+
     theme_bw()})
 
 #  output$histogram <- renderPlot({plot2})
 output$test <- renderPlot({
   plot(cv.teleco_train_5$k, cv.teleco_train_5$dev, type = "b")
 })

 output$mydata <- renderTable(Logistics_table1)
 output$mydata2 <- renderTable(Logistics_table2)
 output$mydata3 <- renderTable(Logistics_table3)
 output$mydata4 <- renderTable(Logistics_table4)
 output$mydata5 <- renderTable(Logistics_table5)
 output$datashyam <- renderTable(teleco)
 output$teleco_final <- renderTable(naive_final)
 output$ldatable <- renderTable(lda_table)
 output$qdatable <- renderTable(qda_table)
 output$knn1 <- renderTable(knntable1)
 output$knn2 <- renderTable(knntable2)
 output$knn3 <- renderTable(knntable3)
 output$knn4 <- renderTable(knntable4)
 output$knn5 <- renderTable(knntable5)
 output$dt <- renderTable(decision_table)
 output$naive <- renderTable(naive_table1)
 output$rf <- renderTable(rf_table)
 # output$dt <- renderTable(naive_table1)
 
})



