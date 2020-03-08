library(shiny)
#install.packages("shinydashboard")
library(shinydashboard)
#libraries 
library(tidyverse)
library(modelr)
library(lubridate) # for date and time
library(caTools) # library used for splitting the dataset




shinyUI(
  dashboardPage( title ="Group 4 - Teleco Customer Churn", skin = "purple",
    dashboardHeader(title = "Customer churn - Group 4"),
    dashboardSidebar(
      sidebarMenu(
      menuItem("Project Information",tabName = "General"),  
      menuItem("Data Exploration",tabName = "dashboard"),
      menuItem("Cost Assumption",tabName="cost"),
      menuItem("Model 1 - Logistic Regression",tabName = "Model1"),
      menuItem("Model 2 - K Nearest Neighbors",tabName = "Model2"),
      menuItem("Model 3 - Tree Based Methods",tabName = "Model3"),
        menuSubItem("Model 3a- Decision Trees", tabName = "Model3a"),
        menuSubItem("Model 3b- Random Forest", tabName = "Model3b"),
      menuItem("Model 4 - Discriminant Analysis",tabName = "Model4"),
        menuSubItem("Model 4a - LDA",tabName = "Model4a"),
        menuSubItem("Model 4b - QDA",tabName = "Model4b"),
      menuItem("Model 5 - Naive Bayes", tabName = "Model5"),
      menuItem("Dimensionality Reduction", tabName ='dr', badgeLabel = "New", badgeColor = "red"  ),
        menuSubItem("P.C.A",tabName = 'PCA'),
      menuItem("Best Model Selection", tabName = "bm"),
      menuItem("Customer Prediction data", tabName = "cpa"),
      menuItem("Raw Data",tabName = "RawData")
    )),
    dashboardBody(
      tabItems(
        tabItem(tabName = "General",
                fluidRow(tags$img(src="project.png"))),
        tabItem(tabName = "dashboard", 
               fluidRow(
                  box(plotOutput("histogram")),
                  sliderInput("bins","Number of bins",1,100,10),
          box(plotOutput("histogram1")),
          box(plotOutput("histogram2")),
          box(plotOutput("histogram3")),
          box(plotOutput("histogram4")),
          box(plotOutput("histogram5")),
          box(plotOutput("histogram6")),
          box(plotOutput("histogram7")),
          box(plotOutput("histogram8")),
          box(plotOutput("histogram9")),
          box(plotOutput("histogram10")),
          box(plotOutput("histogram11")),
          box(plotOutput("histogram12")),
          box(plotOutput("histogram13")),
          box(plotOutput("histogram14")),
          box(plotOutput("histogram15")),
          box(plotOutput("histogram16")),
          box(plotOutput("histogram17")),
          box(plotOutput("histogram18")),
          sliderInput("bw","Binwidth",1,100,10)
          
      )),
      tabItem(tabName = "cost", 
              fluidRow(tags$img(src="boring_meme.jpg"))),
      tabItem(tabName = "Model1",h1("Logistic Regression."),
              fluidRow(
                box(title = "With Probability > 0.5", status = "primary",solidHeader = T, tableOutput('mydata')),
                 box(title = "With Probability > 0.6", status = "primary",solidHeader = T,tableOutput('mydata2')),
                 box(title = "With Probability > 0.7",status = "primary",solidHeader = T,tableOutput('mydata3')),
                 box(title = "With Probability > 0.8",status = "primary",solidHeader = T,tableOutput('mydata4')),
                box(title = "With Probability > 0.4",status = "warning",solidHeader = T,tableOutput('mydata5'))
                
                
              )),
      tabItem(tabName = "Model2",h1("K Nearest Neighbors"),
              fluidRow(
                box(title = "With K = 1", status = "primary",solidHeader = T, tableOutput('knn1')),
                box(title = "With K = 5", status = "primary",solidHeader = T,tableOutput('knn2')),
                box(title = "With K = 10",status = "warning",solidHeader = T,tableOutput('knn3')),
                box(title = "With K = 15",status = "primary",solidHeader = T,tableOutput('knn4')),
                box(title = "With K = 21",status = "primary",solidHeader = T,tableOutput('knn5'))
                
                
              )
              ),
      tabItem(tabName = "RawData",
              fluidRow(
                tableOutput('datashyam')
              )
            ),
    tabItem(tabName = "Model3",h1("Tree Based Method"),
            fluidRow(box(width = 20,"History of Decision Trees. In computer science, Decision tree learning uses a decision tree (as a predictive model) to go 
                     from observations about an item (represented in the branches) 
                     to conclusions about the item's target value (represented in the leaves).
                     It is one of the predictive modeling approaches used in statistics, data mining and machine learning. 
                     Tree models where the target variable can take a discrete set of values are called classification trees;
                     in these tree structures, leaves represent class labels and branches represent conjunctions of features that lead to those class labels. 
                     Decision trees where the target variable can take continuous values (typically real numbers) are called regression trees."),
                     box(width = 5,tags$img(src="meme2.png",height = 400, width = 400)),
                     box(width = 5,tags$img(src="meme3.jpg", height = 400, width = 400))
                     )),
    tabItem(tabName = "Model3a",h1("Decision Trees"),
            fluidRow(
              box(title = "Decision Tree Confusion Matrix", status = "primary", solidHeader = T, tableOutput('dt'))
            )),
    tabItem(tabName = "Model3b",h1("Random Forest"),
            fluidRow(
              box(title = " Random Forest Confusion Matrix", status ="primary", solidHeader = T, tableOutput('rf')))),
    tabItem(tabName = "Model4",h1("Discriminant Analysis"),
            fluidRow(box(width = 20 ,"Discriminant Analysis (DA) is a multivariate classification technique that separates objects into two or more mutually exclusive groups based
on measurable features of those objects. The measurable features are sometimes called predictors or independent variables, while the classification
                         group is the response or what is being predicted.
                         
                         DA uses data where the classes are known beforehand to create a model that may be used to predict future observations. It's useful as an analytic
                         technique trying to understand the relationship between independent variables and a discrete dependent variable. It differs from regression analysis
                         in that the dependent variable must be discrete.It differs from cluster analysis in that the classes must be known beforehand to create the model.")
                     
            )),
    tabItem(tabName = "Model4a",h1("LDA"),
            fluidRow(box(title = "LDA confusion matrix", status = "primary",solidHeader = T, tableOutput('ldatable')))),
    tabItem(tabName = "Model4b",h1("QDA"),
            fluidRow(box(title = "QDA confusion matrix", status = "primary",solidHeader = T, tableOutput('qdatable')))),
    tabItem(tabName = "Model5",h1("Naive Bayes"),
            fluidRow(box(title = "Naive Bayes Confusion matrix", status = "primary", solidHeader = T,tableOutput('naive')))),
    tabItem(tabName = "dr", h1("Dimensionality Reduction"), 
           fluidRow(box(width = 20,"The process of reducing the number of random variables under consideration 
           by obtaining a set of principal variables. It can be divided into feature selection and feature extraction."),
                    box(tags$img(src="dr.jpg", width = 500)))),
    tabItem(tabName = "PCA",h1("Principal Component Analysis")),
    tabItem(tabName = "bm", h1("Selecting the best Model"),
            fluidRow(box(width = 12,tags$img(src="naive.png",height = 150, width = 700))),
                     box(width = 700,tags$img(src="Naivebayes.jpg",height = 300, width = 600))),
    tabItem(tabName = "cpa", h1("Customer's predicted to churn"),
            fluidRow(tableOutput('teleco_final')))
      
      )
  )
)
)

  